// import 'dart:convert';

// import 'package:apiis/model/model.dart';
// import 'package:apiis/model/modelcrud.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;


// class thisapi extends StatefulWidget {
//   const thisapi({super.key});

//   @override
//   State<thisapi> createState() => _myapiState();
// }

// class _myapiState extends State<thisapi> {
//   bool isloadput = false;
//   bool isapiload = false;
//   List<TaskModel> api = [];
//   late Future<List<TaskModel>>? futureTasks;
  
//   void initState() {
//     super.initState();
//     futureTasks = getpost(); // ✅ only once
//   }

//   updateapi(String Id) async {
//     var update = Uri.parse(
//       "https://crudcrud.com/api/4aed4a78b55542b1bb8a2b35e53d0886/tasks/$Id",
//     );
//     var updatee = await http.put(
//       update,
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({"title": "New data", "body": "Bhaijaan"}),
//     );
//   }

//   postspi() async {
//     var posti = Uri.parse(
//       "https://crudcrud.com/api/4aed4a78b55542b1bb8a2b35e53d0886/tasks",
//     );
//     var res = await http.post(
//       posti,
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({"title": "Todo ", "body": "Ashir ", "sId": "1"}),
//     );
//   }

//   Future<List<TaskModel>> getpost() async {
//     api.clear();
//     var url = Uri.parse(
//       "https://crudcrud.com/api/4aed4a78b55542b1bb8a2b35e53d0886/tasks",
//     );
//     var ress = await http.get(url);
//     var ressbddy = jsonDecode(ress.body);

//     for (var maps in ressbddy) {
//       api.add(TaskModel.fromJson(maps));
//     }
//     return api;
//   }

//   DeleteAPI(String Id) async {
//     var del = Uri.parse(
//       "https://crudcrud.com/api/4aed4a78b55542b1bb8a2b35e53d0886/tasks/$Id",
//     );
//     var delete = await http.delete(del);
//     return del;
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: isapiload
//           ? Center(child: CircularProgressIndicator())
//           : FutureBuilder(
//               future: futureTasks,
//               builder: (context, snapshit) {
//                 if (snapshit.hasData) {
//                   return ListView.builder(
//                     itemCount: snapshit.data?.length ?? 0,
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(snapshit.data?[index].title ?? "No Data"),

//                         subtitle: Text(snapshit.data?[index].body ?? "no data"),
//                         leading: IconButton(
//                           onPressed: () async {
//                             await DeleteAPI(snapshit.data?[index].sId ?? "0");

//                             setState(() {
//                               futureTasks = getpost();
//                             });
//                           },
//                           icon: Icon(Icons.delete),
//                         ),
//                         trailing: isloadput
//                             ? CircularProgressIndicator()
//                             : IconButton(
//                                 onPressed: () async {
//                                   isloadput = true;
//                                   setState(() {});
//                                   await updateapi(
//                                     snapshit.data?[index].sId ?? "0",
//                                   );
//                                   isloadput = false;
//                                   futureTasks = getpost();
//                                   setState(() {});
//                                 },
//                                 icon: Icon(Icons.update),
//                               ),
//                       );
//                     },
//                   );
//                 } else {
//                   return Text("Nodata");
//                 }
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           isapiload = true;
//           setState(() {});
//           await postspi();
//           isapiload = false;
//           setState(() {});
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

