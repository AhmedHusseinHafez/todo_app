import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';
import 'package:todo_app/src/features/home/presentation/widgets/list_tile_widget.dart';

class TrashScreen extends StatelessWidget {
  const TrashScreen({
    super.key,
    required this.deletedToDos,
  });

  final List<ToDoModel> deletedToDos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringsManager.pendingDeleteToDos),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p16.w,
          vertical: AppPadding.p16.h,
        ),
        itemBuilder: (context, index) {
          return AbsorbPointer(
            child: ListTileWidget(model: deletedToDos[index]),
          );
        },
        separatorBuilder: (context, index) => 12.verticalSpace,
        itemCount: deletedToDos.length,
      ),
    );
  }
}
