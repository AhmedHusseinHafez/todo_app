class TaskModel {
  final String? id;
  final String? title;
  final String? description;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
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
