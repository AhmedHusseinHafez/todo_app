# An Offline-First Todo List App with Sync Capabilities

## App Features

<details>
     <summary> Click to expand </summary>

* Allows users to manage a todo list with offline-first capabilities. The app should store data locally using Hive and sync data with a remote server when the internet is available. Users should also be able to manually sync data.

</details>


## How to run the project
you only need to change domain in constants.dart and endpoints in webservice.dart and run project successfully.

## App Dependencies

<details>
     <summary> Click to expand </summary>

* [bloc](https://pub.dev/packages/bloc)
* [get_it](https://pub.dev/packages/get_it)
* [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
* [intl](https://pub.dev/packages/intl)
* [Hive](https://pub.dev/packages/hive)
* [freezed](https://pub.dev/packages/freezed)
* [json_serializable](https://pub.dev/packages/json_serializable)
* [json_annotation](https://pub.dev/packages/json_annotation)
* [retrofit](https://pub.dev/packages/retrofit)
* [dio](https://pub.dev/packages/dio)
* [retrofit_generator](https://pub.dev/packages/retrofit_generator)
* [fluttertoast](https://pub.dev/packages/fluttertoast)
* [uuid](https://pub.dev/packages/uuid)
* [logger](https://pub.dev/packages/logger)
* [dio_smart_retry](https://pub.dev/packages/dio_smart_retry)


## Directory Structure
<details>
     <summary> Click to expand </summary>

```
|-- lib
|   -- src
|      |-- core
|      |   |-- resources
|      |   |     '-- assets_manager.dart
|      |   |     '-- bloc_observer.dart
|      |   |     '-- color_manager.dart
|      |   |     '-- common.dart
|      |   |     '-- constants.dart
|      |   |     '-- error_strings.dart
|      |   |     '-- font_manager.dart
|      |   |     '-- injection.dart
|      |   |     '-- local_helper.dart
|      |   |     '-- route_manager.dart	
|      |   |     '-- strings_manager.dart
|      |   |     '-- style_manager.dart
|      |   |     '-- theme_manager.dart
|      |   |     '-- utils.dart
|      |   |     '-- values_manager.dart
|   .  |   |-- web_services
|      |   |    '-- api_result.dart
|      |   |    '-- api_result.freezed.dart
|      |   |    '-- connection_helper.dart
|      |   |    '-- error_model.dart
|      |   |    '-- network_exceptions.dart
|      |   |    '-- network_exceptions.freezed.dart
|      |   |    '-- web_services.dart
|      |   |    '-- web_services.g.dart
|      |   |-- widgets
|      |        '-- default_text_field.dart
|      |-- main.dart
|      |-- app
|      |    '-- app.dart
|      '-- features
|          |-- home
|              |-- data
|              |     '-- local_data_source
|              |          '-- todo_db_service.dart
|              |     '-- models
|              |          '-- todo_model.dart
|              |          '-- todo_model.g.dart
|              |     '-- remote_data_source
|              |          '-- remote_data_source.dart
|              |     '-- repository
|              |          '-- todo_repo.dart
|              |-- logic
|              |     '-- add_todo
|              |     |     '-- add_todo_cubit.dart
|              |     |     '-- add_todo_cubit.freezed.dart
|              |     |     '-- add_todo_state.dart
|              |     '-- delete_todo
|              |     |     '-- delete_todo_cubit.dart
|              |     |     '-- delete_todo_cubit.freezed.dart
|              |     |     '-- delete_todo_state.dart
|              |     '-- get_todo
|              |     |     '-- get_todo_cubit.dart
|              |     |     '-- get_todo_cubit.freezed.dart
|              |     |     '-- get_todo_state.dart
|              |     '-- update_todo
|              |     |     '-- update_todo_cubit.dart
|              |     |     '-- update_todo_cubit.freezed.dart
|              |     |     '-- update_todo_state.dart
|              '-- presentation
|                  '-- screens
|                  |     '-- home_screen.dart    
|                  |     '-- todo_screen.dart  
|                  |     '-- trash_screen.dart
|                  '-- widgets
|                  |     '-- home_list_view.dart
|                  |     '-- list_tile_widget.dart
|                  |     '-- no_todo_widget.dart
|                  |     '-- text_field.dart
|                  |     '-- top_section.dart
|-- pubspec.yaml