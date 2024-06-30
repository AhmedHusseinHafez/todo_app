part of 'check_box_logic_cubit.dart';

@freezed
class CheckBoxLogicState with _$CheckBoxLogicState {
  const factory CheckBoxLogicState.initial() = _Initial;
  const factory CheckBoxLogicState.triggerButton() = _TriggerButton;
  const factory CheckBoxLogicState.buttonTriggered(
      {required String taskStatus}) = _ButtonTriggered;
}
