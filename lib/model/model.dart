// class PostModel {
//   int? userId;
//   int? id;
//   String? title;
//   String? body;

//   PostModel(response, {this.userId, this.id, this.title, this.body});

//   PostModel.myjson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];
//     body = json['body'];
//   }

//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = Map<String, dynamic>();
//   //   data['userId'] = this.userId;
//   //   data['id'] = this.id;
//   //   data['title'] = this.title;
//   //   data['body'] = this.body;
//   // return data;
//   // }
// }
import 'dart:convert';

import 'package:http/http.dart';
