import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/constants.dart';
import 'package:todo_app/src/core/resources/route_manager.dart';

import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';
import 'package:todo_app/src/features/home/presentation/widgets/list_tile_widget.dart';
import 'package:todo_app/src/features/home/presentation/widgets/no_tasks_widget.dart';
import 'package:todo_app/src/features/home/presentation/widgets/top_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  AppBar _appBar() => AppBar(title: Text(StringsManager.welcome), actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.sync,
            color: ColorManager.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_outline,
            color: ColorManager.red,
          ),
        ),
      ]);

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.pushNamed(context, Routes.taskScreen, arguments: {
          "model": null,
        });
      },
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _top(),
          if (tempTasks.isEmpty) const NoTasksWidget(),
          if (tempTasks.isNotEmpty) _list(),
        ],
      ),
    );
  }

  Widget _top() {
    return Container(
      color: ColorManager.white,
      height: 142.h,
      child: const Column(
        children: [
          TopSection(),
          Divider(),
        ],
      ),
    );
  }

  Widget _list() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => Dismissible(
          direction: DismissDirection.endToStart,
          key: Key(tempTasks[index].id!),
          onDismissed: (direction) {
            setState(() {
              tempTasks.removeAt(index);
            });

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Task dismissed')),
            );
          },
          background: Container(
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(10.r)),
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).listTileTheme.tileColor,
                borderRadius: BorderRadius.circular(10.r)),
            child: ListTileWidget(model: tempTasks[index]),
          ),
        ),
        separatorBuilder: (context, index) => 12.verticalSpace,
        itemCount: tempTasks.length,
      ),
    );
  }
}
