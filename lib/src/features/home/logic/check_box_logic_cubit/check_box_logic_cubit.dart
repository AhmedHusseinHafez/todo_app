import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/core/resources/route_manager.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';

part 'check_box_logic_state.dart';
part 'check_box_logic_cubit.freezed.dart';

class CheckBoxLogicCubit extends Cubit<CheckBoxLogicState> {
  CheckBoxLogicCubit() : super(const CheckBoxLogicState.initial());

  void changeTaskState(bool value, TaskModel model) {
    emit(const CheckBoxLogicState.triggerButton());

    if (value == true) {
      model.status = AppConstants.taskStateDone;
    } else {
      model.status = AppConstants.taskStateInProgress;
    }
    model.save();
    RouteGenerator.getTasksCubit.getTasks();
    emit(
      CheckBoxLogicState.buttonTriggered(
        taskStatus: model.status ?? AppConstants.taskStateInProgress,
      ),
    );
  }
}
