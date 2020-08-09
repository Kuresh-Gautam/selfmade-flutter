import 'package:soc/api/sp_model.dart';
import 'package:flutter/material.dart';
import 'package:soc/api/http_service.dart';

class SPDetail extends StatelessWidget {
  final SP post;

  final HttpService httpService = HttpService();

  SPDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(post.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("name"),
                        subtitle: Text(post.name),
                      ),
                      ListTile(
                        title: Text("image"),
                        subtitle: Text("{image}"),
                      ),
                      ListTile(
                        title: Text("slug"),
                        subtitle: Text(post.slug),
                      ),
                      ListTile(
                        title: Text("location"),
                        subtitle: Text("${post.location}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
