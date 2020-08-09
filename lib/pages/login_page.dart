import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soc/pages/home_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;
  String emailText = '';
  String passwordText = '';

  signIn(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Map data = {'username': email, 'password': password};
    print(data);
    var jsonData;
    var response = await http
        .post("http://192.168.100.9:8000/api/account/login", body: data);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        sharedPreferences.setString("token", jsonData["token"]);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Homepage()),
            (Route<dynamic> route) => false);
      });
    } else {
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/sunita.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image(image: AssetImage("assets/soclogo.png")),
              ),
              SizedBox(height: 20),
              Form(
                key: formkey,
                child: Theme(
                  data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 20))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (txt) {
                            setState(() {
                              emailText = txt;
                            });
                          },
                          decoration: InputDecoration(
                            icon: Icon(Icons.email, color: Colors.white),
                            labelText: "Email",
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          onChanged: (txt) {
                            setState(() {
                              passwordText = txt;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            icon: Icon(Icons.lock, color: Colors.white),
                            labelText: "Password",
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: RaisedButton(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          color: Colors.teal,
                          child: Text(
                            "login",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: emailText.isEmpty || passwordText.isEmpty
                              ? null
                              :
                              // emailController.text == "" ||
                              //         passwordController.text == ""
                              //     ? null
                              //     :
                              () {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  signIn(emailController.text,
                                      passwordController.text);
                                },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
