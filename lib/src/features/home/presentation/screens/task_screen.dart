import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/core/resources/route_manager.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/style_manager.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';
import 'package:todo_app/src/core/widgets/default_text_field.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';
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
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        (widget.model == null)
            ? StringsManager.createNewTask
            : StringsManager.upDateTask,
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
              _button(),
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
        hintStyle: StyleManager.getBoldStyle(),
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

  Widget _button({bool isLoading = false}) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          if (widget.model == null) {
            RouteGenerator.tasksLogicCubit.addTask(
              TaskModel(
                id: const Uuid().v1(),
                title: _titleCtr.text,
                description: _descCtr.text,
                status: AppConstants.taskStateInProgress,
                isDone: false,
                createdAt: DateTime.now().toString(),
                updatedAt: null,
              ),
            );
          } else {}
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
    super.dispose();
  }
}
