import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/src/app/app.dart';
import 'package:todo_app/src/core/resources/color_manager.dart';
import 'package:todo_app/src/core/resources/injection.dart';
import 'package:todo_app/src/core/resources/route_manager.dart';
import 'package:todo_app/src/core/resources/strings_manager.dart';
import 'package:todo_app/src/core/resources/utils.dart';
import 'package:todo_app/src/core/resources/values_manager.dart';
import 'package:todo_app/src/features/home/data/models/todo_model.dart';
import 'package:todo_app/src/features/home/data/repository/todo_repo.dart';
import 'package:todo_app/src/features/home/logic/delete_todo/cubit/delete_todo_cubit.dart';
import 'package:todo_app/src/features/home/logic/get_todo/get_todo_cubit.dart';
import 'package:todo_app/src/features/home/presentation/widgets/home_list_view.dart';
import 'package:todo_app/src/features/home/presentation/widgets/no_todo_widget.dart';
import 'package:todo_app/src/features/home/presentation/widgets/top_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDoModel>? list;
  @override
  void initState() {
    super.initState();
    RouteGenerator.getToDoCubit.getToDos();
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
          try {
            if (kInternetConnection != null &&
                kInternetConnection != ConnectivityResult.none) {
              getIt<ToDoRepository>().syncWithServer().then((value) {
                RouteGenerator.getToDoCubit.getToDos();
              });
              showSuccessToast(StringsManager.toDosSyncedSuccessfully, context);
            }
          } catch (error) {
            showErrorToast(error.toString(), context);
          }
        },
        icon: const Icon(
          Icons.sync,
          color: ColorManager.black,
        ),
      ),
      IconButton(
        onPressed: () {
          if (list != null) {
            Navigator.pushNamed(context, Routes.trashScreen, arguments: {
              "deletedToDos": list!.where((e) => e.isDeleted == true).toList(),
            });
          }
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
    return BlocConsumer<GetToDoCubit, GetToDosState>(
      listener: (context, state) {
        state.mapOrNull(
          getToDosSuccess: (state) => list = state.todos,
          getToDosError: (state) => showErrorToast(state.error, context),
        );
      },
      builder: (context, state) {
        var filteredList =
            list?.where((model) => model.isDeleted == false).toList();

        if (state == const GetToDosState.getToDosLoading()) {
          return _buildLoading();
        } else if (filteredList != null && filteredList.isNotEmpty) {
          return BlocProvider(
            create: (context) => DeleteTodoCubit(getIt<ToDoRepository>()),
            child: HomeListView(list: filteredList),
          );
        } else {
          return const NoToDosWidget();
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
        Navigator.pushNamed(context, Routes.todoScreen, arguments: {
          // model is [null] because we are [creating a new todo] in this screen and [not editing an existing one].
          "model": null,
        });
      },
    );
  }
}
