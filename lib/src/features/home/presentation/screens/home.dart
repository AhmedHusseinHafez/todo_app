import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';

import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';
import 'package:todo_app/src/features/home/presentation/widgets/list_tile_widget.dart';
import 'package:todo_app/src/features/home/presentation/widgets/text_field.dart';
import 'package:todo_app/src/features/home/presentation/widgets/top_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> item = List<int>.generate(10, (index) => index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(StringsManager.welcome)),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: double.infinity,
              height: .8.sh,
              child: Center(child: TaskTextField()),
            ),
          );
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _top(),
          // const NoTasksWidget(),
          _list(),
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
          key: ValueKey<int>(item[index]),
          onDismissed: (direction) {
            setState(() {
              item.removeAt(index);
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
            child: ListTileWidget(
              title: "Go To Gym ${item[index]}",
              description:
                  "Go To Gym Go To Gym Go To Gym Go To Gym Go To Gym Go To Gym Go To Gym Go To Gym Go To Gym Go To Gym Go To Gym",
            ),
          ),
        ),
        separatorBuilder: (context, index) => 12.verticalSpace,
        itemCount: item.length,
      ),
    );
  }
}
