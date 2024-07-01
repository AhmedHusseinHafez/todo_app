import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/route_manager.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';
import 'package:todo_app/src/features/home/logic/delete_todo/cubit/delete_todo_cubit.dart';
import 'package:todo_app/src/features/home/presentation/widgets/list_tile_widget.dart';

class HomeListView extends StatelessWidget {
  const HomeListView({
    super.key,
    required this.list,
  });

  final List<ToDoModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: AppPadding.p12.h),
      itemBuilder: (context, index) {
        return _dismissibleWidget(context: context, model: list[index]);
      },
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemCount: list.length,
    );
  }

  Widget _dismissibleWidget(
      {required BuildContext context, required ToDoModel model}) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(model.id),
      onDismissed: (direction) {
        context.read<DeleteTodoCubit>().deleteTodo(id: model.id).then((value) {
          RouteGenerator.getToDoCubit.getToDos();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: const Duration(milliseconds: 1000),
              content: Text('${StringsManager.delete} ${model.title}')),
        );
      },
      background: _deleteWidget(),
      child: _card(context, model),
    );
  }

  Widget _card(BuildContext context, ToDoModel model) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).listTileTheme.tileColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: ListTileWidget(model: model),
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
