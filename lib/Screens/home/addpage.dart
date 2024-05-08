import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_app/utils/AppColor.dart';
import 'package:todo_app/utils/textstyle.dart';
import 'package:todo_app/widgets/globalwidgets.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _controllerforAddTask = TextEditingController();
  final TextEditingController _controllerforAddDescription =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        title: Text(
          'Add Todo',
          style: forAppBar,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.buttonColor, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColor.buttonColor, width: 2)),
              hintStyle: TextStyle(color: Colors.grey),
              hintText: 'Title',
            ),
          ),
          addVerticalSpace(10.0),
          TextField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.buttonColor, width: 2)),
                hintStyle: TextStyle(color: Colors.grey),
                hintText: 'Description',
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.buttonColor, width: 2))),
            keyboardType: TextInputType.multiline,
            minLines: 3,
            maxLines: 8,
          ),
          addVerticalSpace(50),
          ElevatedButton(onPressed: SubmitData, child: Text('Submit'))
        ],
      ),
    );
  }

  void SubmitData() async {
    final title = _controllerforAddTask.text;
    final description = _controllerforAddDescription.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false
    };

    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(uri, body: jsonEncode(body),
    
    );
    print(response.statusCode);
    print(response.body);

  }
}
