class TaskModel {
  String? sId;
  String? title;
  String? body;

  TaskModel({this.sId, this.title, this.body});

  TaskModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    body = json['body'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['_id'] = this.sId;
  //   data['title'] = this.title;
  //   data['body'] = this.body;
  //   return data;
  // }
}
