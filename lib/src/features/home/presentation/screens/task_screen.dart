import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/constants.dart';
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
              _title(),
              10.verticalSpace,
              _desc(),
              _button(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _desc() {
    return TaskTextField(
      hint: StringsManager.description,
      controller: _descCtr,
    );
  }

  Widget _button() {
    return ElevatedButton(
      onPressed: () {
        if (widget.model == null) {
          tempTasks.add(
            TaskModel(
              id: const Uuid().v1(),
              title: _titleCtr.text, // 1
              description: _descCtr.text, // 2
              status: "In Progress", // 3
              isDone: false, // 4
              createdAt: DateTime.now().toString(), // 5
              updatedAt: null, // 6
            ),
          );
        } else {}
      },
      child: Text(
        (widget.model == null)
            ? StringsManager.createNewTask
            : StringsManager.upDateTask,
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
    );
  }

  @override
  void dispose() {
    _titleCtr.dispose();
    _descCtr.dispose();
    super.dispose();
  }
}
