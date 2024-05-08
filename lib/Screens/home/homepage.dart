import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/Data/global_data.dart';
import 'package:todo_app/utils/AppColor.dart';
import 'package:todo_app/utils/textstyle.dart';
import 'package:todo_app/widgets/globalwidgets.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostMethod() async {
    final title = _controllerforAddTask.text;
    final Description = _controllerforAddDescription.text;
    final body = {
      "name": title,
      "description": Description,
      "age": 2,
      "colour": "blue"
    };
    final api =
        'https://crudcrud.com/api/834d37e8bf394f118d4f0c7ff1a24b8a/unicorns';
    final uri = Uri.parse(api);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      _controllerforAddTask.text = '';
      _controllerforAddDescription.text = '';
      showusccessmessage(context, 'Creation Complete');
    } else {
      showerrormessage(context, 'Exception Error');
    }
  }

  getdata() async {
    final api =
        'https://crudcrud.com/api/834d37e8bf394f118d4f0c7ff1a24b8a/unicorns';
    final uri = Uri.parse(api);
    final response = await http.get(uri);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    return responsebody;
  }
  deltemethod(String id)async{
     final api =
        'https://crudcrud.com/api/834d37e8bf394f118d4f0c7ff1a24b8a/unicorns';
    final uri = Uri.parse(api);
    final response = await http.delete(uri);
  }

  final TextEditingController _controllerforAddTask = TextEditingController();
  final TextEditingController _controllerforAddDescription =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
//Get Size
    final ScreenSize = MediaQuery.sizeOf(context);
    final height = ScreenSize.height;
    final width = ScreenSize.width;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo2.png',
                height: height * 0.050,
              ),
              Text(
                'UpTodo',
                style: forAppBar,
              )
            ],
          )),
      body: SafeArea(
          child: FutureBuilder(
        future: getdata(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.flag),
                    ),
                    title: Text(snapshot.data[index]['name']),
                    tileColor: AppColor.buttonColor,
                    trailing: SizedBox(
                        width: width * 0.250,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.edit)),
                          ],
                        )),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.buttonColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: SizedBox(
                  height: height * 0.350,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Add Task'),
                        text_Field(
                            string: 'Add Task',
                            controller: _controllerforAddTask),
                        addVerticalSpace(10.0),
                        Text('Add Description'),
                        text_Field(
                            string: 'Add description',
                            controller: _controllerforAddDescription),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Close'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  PostMethod();
                                  getdata();
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Add'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: AppColor.AppBarColor,
        ),
      ),
    );
  }
}
