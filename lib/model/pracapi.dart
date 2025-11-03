import 'dart:convert';
import 'package:apiis/model/modelcrud.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Prac extends StatefulWidget {
  const Prac({super.key});

  @override
  State<Prac> createState() => _PracState();
}

class _PracState extends State<Prac> {
  List<TaskModel> Apiss = [];
  // late Future<List<TaskModel>> fututask;

  String urrl =
      "https://crudcrud.com/api/38151da94ac246f3849c1489c7feaba6/tasks";

  @override
  void initState() {
    super.initState();
    var fututask = getapi(); // ✅ only once call
  }

  Future<List<TaskModel>> getapi() async {
    try {
      Apiss.clear();
      var url = Uri.parse(urrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var item in data) {
          Apiss.add(TaskModel.fromJson(item));
        }
      } else {
        debugPrint("Get Failed:${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error Occured : $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to add data $e")));
    }
    return Apiss;
  }

  Future<void> post() async {
    var url = Uri.parse(urrl);
    await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": "my app", "body": "Sensation"}),
    );
  }

  Future<void> deleteapi(String id) async {
    var url = Uri.parse("$urrl/$id");
    await http.delete(url);
  }

  put(String id) async {
    var url = Uri.parse("$urrl/$id");
    var puti = http.put(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": "Updated App",
        "body": "This is my Iphone App",
      }),
    );
  }

  bool ispost = false;
  String? deletingId; // ✅ for per-item loader
  String? putId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fututask, // ✅ fixed future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final task = snapshot.data![index];
                return ListTile(
                  title: Text(task.title ?? "No title"),
                  subtitle: Text(task.body ?? "No body"),
                  trailing: deletingId == task.sId
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            setState(() => deletingId = task.sId);
                            await deleteapi(task.sId ?? "");
                            setState(() {
                              fututask = getapi(); // ✅ refresh list
                              deletingId = null;
                            });
                          },
                        ),
                  leading: putId == task.sId
                      ? SizedBox(
                          height: 20,
                          width: 20,

                          child: CircularProgressIndicator(),
                        )
                      : IconButton(
                          onPressed: () async {
                            setState(() => putId = task.sId);
                            await put(task.sId ?? "");
                            setState(() {
                              fututask = getapi(); // ✅ refresh list
                              putId = null;
                            });
                          },
                          icon: Icon(Icons.update),
                        ),
                );
              },
            );
          } else {
            return Center(child: Text("No Data Found"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() => ispost = true);
          await post();
          setState(() {
            fututask = getapi(); // ✅ refresh list after post
            ispost = false;
          });
        },
        child: ispost
            ? CircularProgressIndicator(color: Colors.white)
            : Icon(Icons.add),
      ),
    );
  }
}
