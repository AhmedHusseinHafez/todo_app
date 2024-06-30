import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/core/resources/route_manager.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';
import 'package:todo_app/src/features/home/logic/check_box_logic_cubit/check_box_logic_cubit.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key,
    required this.model,
  });

  final TaskModel model;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: RouteGenerator.checkBoxLogicCubit,
      child: BlocBuilder<CheckBoxLogicCubit, CheckBoxLogicState>(
        builder: (context, state) {
          return Checkbox(
            value: _value(),
            onChanged: (value) {
              context.read<CheckBoxLogicCubit>().changeTaskState(
                    value!,
                    widget.model,
                  );
            },
          );
        },
      ),
    );
  }

  bool _value() {
    return widget.model.status == AppConstants.taskStateDone ? true : false;
  }
}
