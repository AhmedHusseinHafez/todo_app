import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/font_manager.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/style_manager.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _checkbox(),
      title: Text(title),
      subtitle: _desc(),
      trailing: _status(),
    );
  }

  Widget _status() {
    return SizedBox(
      width: 70.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            false ? StringsManager.doneState : StringsManager.inProgressState,
            style: StyleManager.getMediumStyle(
              fontSize: FontSize.s16,
              color: false ? ColorManager.green : ColorManager.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _desc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: StyleManager.getMediumStyle(),
        ),
        6.verticalSpace,
        _time(time: "Created At: Jun,28"),
        5.verticalSpace,
        _time(time: "Updated At: Jun,28"),
      ],
    );
  }

  Widget _checkbox() {
    return Checkbox(
      value: false,
      onChanged: (value) {},
    );
  }

  Widget _time({required String time}) {
    return Row(
      children: [
        const Icon(
          Icons.access_time_rounded,
          size: 15,
        ),
        5.horizontalSpace,
        Text(
          time,
          style: StyleManager.getRegularStyle(),
        ),
      ],
    );
  }
}
