import 'package:flutter/material.dart';
import 'package:soc/pages/login_page.dart';

class Soc extends StatelessWidget {
  Widget mybox() {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      child: Column(
        children: <Widget>[
          Image.asset("assets/logo1.jpg"),
          Text("workshop"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.amber,
              backgroundImage: AssetImage("assets/logo.png"),
            ),
            SizedBox(width: 10),
            Text("Service On Call"),
            SizedBox(width: 30),
            RaisedButton(
              color: Colors.red,
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20.0),
              child: Text(
                "service provider:",
                style: TextStyle(fontSize: 30),
              ),
            ),
            mybox(),
            mybox(),
            mybox(),
            mybox(),
            mybox(),
            mybox(),
            mybox(),
            mybox(),
          ],
        ),
      ),
    );
  }
}
