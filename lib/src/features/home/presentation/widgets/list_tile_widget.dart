import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/font_manager.dart';
import 'package:todo_app/src/core/resources/route_manager.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/style_manager.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';

class ListTileWidget extends StatefulWidget {
  const ListTileWidget({
    super.key,
    required this.model,
  });

  final TaskModel model;

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, Routes.taskScreen, arguments: {
          "model": widget.model,
        });
      },
      leading: _checkbox(),
      title: Text(widget.model.title ?? ''),
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
            (widget.model.isDone ?? false)
                ? StringsManager.doneState
                : StringsManager.inProgressState,
            style: StyleManager.getMediumStyle(
              fontSize: FontSize.s16,
              color: (widget.model.isDone ?? false)
                  ? ColorManager.green
                  : ColorManager.blue,
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
          widget.model.description ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: StyleManager.getMediumStyle(),
        ),
        6.verticalSpace,
        _time(time: "${StringsManager.createdAt} ${widget.model.createdAt}"),
        if (widget.model.updatedAt != null) 5.verticalSpace,
        if (widget.model.updatedAt != null)
          _time(time: "${StringsManager.updatedAt} ${widget.model.updatedAt}"),
      ],
    );
  }

  Widget _checkbox() {
    return Checkbox(
      value: widget.model.isDone ?? false,
      onChanged: (value) {
        setState(() {
          widget.model.isDone = value!;
        });
      },
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
