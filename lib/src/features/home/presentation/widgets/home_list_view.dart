import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';
import 'package:todo_app/src/features/home/presentation/widgets/list_tile_widget.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
    required this.list,
  });

  final List<TaskModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Dismissible(
        direction: DismissDirection.endToStart,
        key: Key(list[index].id!),
        onDismissed: (direction) {
          // setState(() {
          //   list.removeAt(index);
          // });

          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Task dismissed')),
          // );
        },
        background: _deleteWidget(),
        child: _card(context, index),
      ),
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemCount: list.length,
    );
  }

  Widget _card(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).listTileTheme.tileColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: ListTileWidget(model: list[index]),
    );
  }

  Widget _deleteWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10.r)),
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p11.w),
        child: const Icon(Icons.delete, color: ColorManager.white),
      ),
    );
  }
}
