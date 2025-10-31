// import 'dart:convert';

// import 'package:apiis/model/modelcrud.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// final String baseurl =  "https://crudcrud.com/api/8e9fdd9d44f24f4b90f6d7bda1015471/tasks";
// class ApiClass{

// Future geto() async{
// var url = Uri.parse(baseurl); 
// try {
// var res = await http.get(url);
// if (res.statusCode == 200) {
//   var respo = jsonDecode(res.body);
// }
// else{
//   "Failed to Result : ${res.statusCode}";
// }
// }
// catch(error){
//  ScaffoldMessenger.of(
//   context
//   ).
//  showSnackBar(SnackBar(content: Text("Error : $error")));
// }

// }
// }
// Future<void>pos(String title ,String body)async{
// final url = Uri.parse(baseurl);
// try {
//   final posi = await http.post(url,headers : {"Content-Type": "application/json"},
//   body: jsonEncode({"title":"Ashir App","body":"This is my struggle Journey"}));
// if (posi.statusCode == 201) {
//  throw Exception("Error: ${posi.statusCode}");
// }

// } catch (e) {
// throw Exception(  "Unable Data");


// }

// }