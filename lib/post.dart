import 'package:flutter/material.dart';
import 'package:soc/user_model.dart';
import 'package:http/http.dart' as http;

class Post extends StatefulWidget {
  Post({Key key}) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

Future<UserModel> createUser(String name, String jobtitle) async {
  final String apiUrl = "http://reqres.in/api/users";

  final response =
      await http.post(apiUrl, body: {"name": name, "job": jobtitle});

  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelFromJson(responseString);
  } else {
    return null;
  }
}

class _PostState extends State<Post> {
  UserModel _user;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("create user"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
            ),
            TextField(
              controller: jobController,
            ),
            SizedBox(height: 32),
            _user == null
                ? Container()
                : Text(
                    "The user ${_user.name}, ${_user.id} is created successfully at time ${_user.createdAt.toIso8601String()}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String name = nameController.text;
          final String jobtitle = jobController.text;

          final UserModel user = await createUser(name, jobtitle);
          setState(() {
            _user = user;
          });
        },
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
    );
  }
}
