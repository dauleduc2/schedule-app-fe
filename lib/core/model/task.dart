import 'package:schedule_app_fe/core/model/image.dart';
import 'package:schedule_app_fe/core/model/user.dart';

class Task {
  String id;
  String createdAt;
  String updatedAt;
  String title;
  String description;
  String priority;
  String fromDate;
  String toDate;
  User owner;
  final List<ImageUrl> images;
  Task(
      {required this.id,
      required this.createdAt,
      required this.updatedAt,
      required this.title,
      required this.description,
      required this.priority,
      required this.fromDate,
      required this.toDate,
      required this.owner,
      required this.images});
}
