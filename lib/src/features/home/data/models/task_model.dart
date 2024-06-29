import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? status;
  @HiveField(4)
  final String? createdAt;
  @HiveField(5)
  final String? updatedAt;
  @HiveField(6)
  bool? isDone;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isDone,
  });
}
