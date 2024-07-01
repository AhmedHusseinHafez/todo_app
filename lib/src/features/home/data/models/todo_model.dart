import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class ToDoModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? status;
  @HiveField(4)
  final String createdAt;
  @HiveField(5)
  String? updatedAt;

  @HiveField(6)
  bool? isSynced;

  @HiveField(7)
  late bool isDeleted;

  ToDoModel({
    required this.id,
    required this.title,
    required this.description,
    this.status,
    required this.createdAt,
    this.updatedAt,
    this.isSynced = false,
    this.isDeleted = false,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) {
    return ToDoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      isSynced: json['isSynced'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isSynced': isSynced,
    };
  }

  ToDoModel copyWith({
    String? id,
    String? title,
    String? description,
    String? status,
    String? createdAt,
    String? updatedAt,
    bool? isSynced,
  }) {
    return ToDoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
    );
  }
}
