import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Task Debidatta'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Future<UserModel> createUser(String name, String jobTitle) async {
  final String apiUrl = "https://reqres.in/api/users";

  final response =
      await http.post(apiUrl, body: {"name": name, "job": jobTitle});

  if (response.statusCode == 201) {
    final String responseString = response.body;

    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Enter Name'),
              controller: nameController,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Add Description'),
              controller: jobController,
            ),
            SizedBox(
              height: 32,
            ),
            _user == null
                ? Container()
                : Text(
                    "The user : ${_user.name}, User ID ${_user.id} Description  : ${_user.job} at time ${_user.createdAt.toIso8601String()}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String name = nameController.text;
          final String jobTitle = jobController.text;

          final UserModel user = await createUser(name, jobTitle);

          setState(() {
            _user = user;
          });
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}
