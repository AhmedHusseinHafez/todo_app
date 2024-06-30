import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/core/resources/font_manager.dart';
import 'package:todo_app/src/core/resources/route_manager.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/style_manager.dart';
import 'package:todo_app/src/core/resources/utils.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';
import 'package:todo_app/src/core/widgets/default_text_field.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';
import 'package:todo_app/src/features/home/logic/add_task/add_task_cubit.dart';
import 'package:todo_app/src/features/home/logic/check_box_logic_cubit/check_box_logic_cubit.dart';
import 'package:todo_app/src/features/home/presentation/widgets/check_box.dart';
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

  String? taskStatus;

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
    return BlocProvider.value(
      value: RouteGenerator.checkBoxLogicCubit,
      child: BlocConsumer<CheckBoxLogicCubit, CheckBoxLogicState>(
        listener: (context, state) {
          state.mapOrNull(
            buttonTriggered: (state) {
              taskStatus = state.taskStatus;
            },
          );
        },
        builder: (context, state) {
          return Text(
            "${StringsManager.taskStatus}: ${taskStatus ?? widget.model!.status}",
            style: StyleManager.getMediumStyle(
              fontSize: FontSize.s16,
              color: (widget.model!.status == AppConstants.taskStateDone
                      ? true
                      : false)
                  ? ColorManager.green
                  : ColorManager.blue,
            ),
          );
        },
      ),
    );
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
              _buildButtonBloc(),
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
        CheckBoxWidget(model: widget.model!),
        Text(StringsManager.isTaskCompleted),
      ],
    );
  }

  Widget _buildButtonBloc() {
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        state.mapOrNull(
          createTaskSuccess: (_) {
            showSuccessToast(StringsManager.taskCreated, context);
          },
          createTaskError: (state) {
            showErrorToast(state.error, context);
          },
        );
        return _button(
          isLoading:
              state == const AddTaskState.createTaskLoading() ? true : false,
        );
      },
    );
  }

  Widget _button({required bool isLoading}) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          if (widget.model == null) {
            context.read<AddTaskCubit>().addTask(
                  TaskModel(
                    id: const Uuid().v1(),
                    title: _titleCtr.text,
                    description: _descCtr.text,
                    status: AppConstants.taskStateInProgress,
                    createdAt: DateTime.now().toIso8601String(),
                    updatedAt: DateTime.now().toIso8601String(),
                  ),
                );
            _titleCtr.clear();
            _descCtr.clear();
            RouteGenerator.getTasksCubit.getTasks();
          } else {
            // try {
            //   widget.model?.title = _titleCtr.text;
            //   widget.model?.description = _descCtr.text;
            //   widget.model?.updatedAt = DateTime.now().toIso8601String();
            //   widget.model?.save();
            //   showSuccessToast(StringsManager.taskUpdated, context);
            // } catch (error) {
            //   showErrorToast(error.toString(), context);
            // }
          }
        } else {
          _autoValidateMode = AutovalidateMode.onUserInteraction;
        }
      },
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
