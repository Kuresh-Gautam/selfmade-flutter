import 'package:soc/api/http_service.dart';
import 'package:soc/api/SP_detail.dart';
import 'package:soc/api/sp_model.dart';
import 'package:flutter/material.dart';

class GetPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SERVICE PROVIDER"),
      ),
      body: FutureBuilder(
        future: httpService.fetchData(page: 1),
        builder: (BuildContext context, AsyncSnapshot<List<SP>> snapshot) {
          if (snapshot.hasData) {
            List<SP> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (SP post) => ListTile(
                      title: Text(post.name),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SPDetail(
                            post: post,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
