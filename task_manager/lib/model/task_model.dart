class TaskModel {
  int? id;
  String? taskName;
  bool? isCompleted;
  String? createDate;

  TaskModel({
    this.taskName,
    this.createDate,
    this.id,
    this.isCompleted,
  });

  TaskModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    isCompleted = json['isCompleted'] == 1;
    taskName = json['taskName'];
    createDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['isCompleted'] = this.isCompleted;
    data['taskName'] = this.taskName;
    data['createdDate'] = this.createDate;
    return data;
  }
}