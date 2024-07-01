import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/injection.dart';
import 'package:todo_app/src/core/resources/route_manager.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/utils.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';
import 'package:todo_app/src/features/home/data/models/task_model.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';
import 'package:todo_app/src/features/home/logic/get_tasks/get_tasks_cubit.dart';
import 'package:todo_app/src/features/home/presentation/widgets/home_list_view.dart';
import 'package:todo_app/src/features/home/presentation/widgets/no_tasks_widget.dart';
import 'package:todo_app/src/features/home/presentation/widgets/top_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskModel>? list;
  @override
  void initState() {
    super.initState();
    RouteGenerator.getTasksCubit.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  AppBar _appBar() {
    return AppBar(title: Text(StringsManager.welcome), actions: [
      IconButton(
        onPressed: () {
          getIt<ToDoRepository>().syncWithServer().then((value) {
            RouteGenerator.getTasksCubit.getTasks();
          });
        },
        icon: const Icon(
          Icons.sync,
          color: ColorManager.black,
        ),
      ),
      IconButton(
        onPressed: () {
          getIt<ToDoRepository>().deleteAllToDos();
        },
        icon: const Icon(
          Icons.delete_outline,
          color: ColorManager.red,
        ),
      ),
    ]);
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

  Widget _buildBloc() {
    return BlocConsumer<GetTasksCubit, GetTasksState>(
      listener: (context, state) {
        state.mapOrNull(
          getTasksSuccess: (state) => list = state.tasks,
        );
      },
      builder: (context, state) {
        state.mapOrNull(
          getTasksSuccess: (state) => list = state.tasks,
          getTasksError: (state) => showErrorToast(state.error, context),
        );

        if (state == const GetTasksState.getTasksLoading()) {
          return _buildLoading();
        } else if (list != null) {
          return HomeListView(list: list!);
        } else {
          return const NoTasksWidget();
        }
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
          Expanded(child: _buildBloc()),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Column(
      children: [
        0.3.sh.verticalSpace,
        Center(child: CupertinoActivityIndicator(radius: 15.r)),
      ],
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Navigator.pushNamed(context, Routes.taskScreen, arguments: {
          // model is [null] because we are [creating a new task] in this screen and [not editing an existing one].
          "model": null,
        });
      },
    );
  }
}
