import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/core/resources/font_manager.dart';
import 'package:todo_app/src/core/resources/injection.dart';
import 'package:todo_app/src/core/resources/route_manager.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/style_manager.dart';
import 'package:todo_app/src/core/resources/utils.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';
import 'package:todo_app/src/core/widgets/default_text_field.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';
import 'package:todo_app/src/features/home/logic/add_task/add_task_cubit.dart';
import 'package:todo_app/src/features/home/logic/update_task/update_task_cubit.dart';
import 'package:todo_app/src/features/home/presentation/widgets/text_field.dart';
import 'package:uuid/uuid.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({
    super.key,
    this.model,
  });

  final TaskModel? model;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late final TextEditingController _titleCtr;

  late final TextEditingController _descCtr;

  final _formKey = GlobalKey<FormState>();

  var _autoValidateMode = AutovalidateMode.disabled;

  bool? taskStatusValue;

  @override
  void initState() {
    super.initState();
    _titleCtr = TextEditingController(
        text: (widget.model == null) ? '' : widget.model!.title);

    _descCtr = TextEditingController(
        text: (widget.model == null) ? '' : widget.model!.description);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        RouteGenerator.getTasksCubit.getTasks();
      },
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        (widget.model == null)
            ? StringsManager.createNewTask
            : StringsManager.upDateTask,
      ),
      actions: [
        if (widget.model != null) _taskState(),
        if (widget.model != null) _deleteTask(),
      ],
    );
  }

  Widget _deleteTask() {
    return IconButton(
      onPressed: () {
        widget.model!.delete();
        Navigator.of(context).pop();
        showSuccessToast(
          "${StringsManager.taskDeleted} ${widget.model?.title}",
          context,
        );
      },
      icon: const Icon(
        Icons.delete_outlined,
        color: ColorManager.red,
      ),
    );
  }

  Widget _taskState() {
    return Text(
      "${StringsManager.taskStatus}: ${_taskStatus(taskStatusValue: taskStatusValue)}",
      style: StyleManager.getMediumStyle(
        fontSize: FontSize.s16,
        color: _taskStatusValue(
                taskStatus: _taskStatus(taskStatusValue: taskStatusValue))
            ? ColorManager.green
            : ColorManager.blue,
      ),
    );
  }

  String _taskStatus({bool? taskStatusValue}) {
    if (taskStatusValue == true) {
      return AppConstants.taskStateDone;
    } else if (taskStatusValue == false) {
      return AppConstants.taskStateInProgress;
    } else {
      return widget.model!.status!;
    }
  }

  bool _taskStatusValue({required String taskStatus}) {
    if (taskStatus == AppConstants.taskStateDone) {
      return true;
    } else if (taskStatus == AppConstants.taskStateInProgress) {
      return false;
    } else {
      return widget.model!.status == AppConstants.taskStateDone ? true : false;
    }
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _form(),
              15.verticalSpace,
              if (widget.model != null) _checkbox(),
              15.verticalSpace,
              if (widget.model != null) _buildUpdateTask(),
              if (widget.model == null) _buildAddTask(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form() {
    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: Column(
        children: [
          _title(),
          10.verticalSpace,
          _desc(),
        ],
      ),
    );
  }

  Widget _title() {
    return DefaultTextFieldWidget(
      controller: _titleCtr,
      decoration: InputDecoration(
        hintText: StringsManager.title,
        hintStyle: StyleManager.getBoldStyle(fontSize: FontSize.s18),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return StringsManager.titleRequired;
        }
        return null;
      },
    );
  }

  Widget _desc() {
    return TaskTextField(
      hint: StringsManager.description,
      controller: _descCtr,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return StringsManager.descRequired;
        }
        return null;
      },
    );
  }

  Widget _checkbox() {
    return Row(
      children: [
        Checkbox(
          value: taskStatusValue ??
                  widget.model?.status == AppConstants.taskStateDone
              ? true
              : false,
          onChanged: (value) {
            setState(() {
              taskStatusValue = value!;
            });
          },
        ),
        Text(StringsManager.isTaskCompleted),
      ],
    );
  }

  Widget _buildAddTask() {
    return BlocProvider(
      create: (context) => AddTaskCubit(getIt<ToDoRepository>()),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          state.mapOrNull(
            createTaskSuccess: (_) {
              showSuccessToast(StringsManager.taskCreated, context);
            },
            createTaskError: (state) {
              showErrorToast(state.error, context);
            },
          );
        },
        builder: (context, state) {
          return _button(
            isLoading:
                state == const AddTaskState.createTaskLoading() ? true : false,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<AddTaskCubit>().addTask(
                      TaskModel(
                        id: const Uuid().v1(),
                        title: _titleCtr.text,
                        description: _descCtr.text,
                        status: AppConstants.taskStateInProgress,
                        createdAt: DateTime.now().toIso8601String(),
                        updatedAt: DateTime.now().toIso8601String(),
                        isSynced: false,
                      ),
                    );
                _titleCtr.clear();
                _descCtr.clear();
              } else {
                _autoValidateMode = AutovalidateMode.onUserInteraction;
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildUpdateTask() {
    return BlocProvider(
      create: (context) => UpdateTaskCubit(getIt<ToDoRepository>()),
      child: BlocConsumer<UpdateTaskCubit, UpdateTaskState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (_) {
              showSuccessToast(StringsManager.taskUpdated, context);
            },
            failure: (state) {
              showErrorToast(state.error, context);
            },
          );
        },
        builder: (context, state) {
          return _button(
            isLoading: state == const UpdateTaskState.loading() ? true : false,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                var newModel = TaskModel(
                  id: widget.model!.id,
                  createdAt: widget.model!.createdAt,
                  title: _titleCtr.text,
                  description: _descCtr.text,
                  status: (taskStatusValue == true
                      ? AppConstants.taskStateDone
                      : (taskStatusValue == false
                          ? AppConstants.taskStateInProgress
                          : widget.model!.status)),
                  updatedAt: DateTime.now().toIso8601String(),
                  isSynced: false,
                );
                context.read<UpdateTaskCubit>().updateTask(
                      oldModel: widget.model!,
                      newModel: newModel,
                    );
              } else {
                _autoValidateMode = AutovalidateMode.onUserInteraction;
              }
            },
          );
        },
      ),
    );
  }

  Widget _button(
      {required bool isLoading, required void Function()? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading
          ? SizedBox(
              width: 20.w,
              height: 20.h,
              child: CircularProgressIndicator(strokeWidth: 1.5.h),
            )
          : Text(
              (widget.model == null)
                  ? StringsManager.createNewTask
                  : StringsManager.upDateTask,
            ),
    );
  }

  @override
  void dispose() {
    _titleCtr.dispose();
    _descCtr.dispose();
    Fluttertoast.cancel();
    super.dispose();
  }
}
