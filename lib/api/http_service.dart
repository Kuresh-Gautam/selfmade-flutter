import 'package:soc/api/sp_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class HttpService {
  final String url = "http://192.168.100.9:8000/api/soc/listsp?page=";

  Future<List<SP>> fetchData({int page = 1}) async {
    Response res = await get(
      url + page.toString(),
      headers: {
        "Authorization": "Token f4383755c220cef79a2c8758766bb4b2b59a9f14"
      },
    );

    if (res.statusCode == 200) {
      List<SP> spList = responseToSpList(res.body);
      return spList;
    }
  }

  List<SP> responseToSpList(String responseBody) {
    Map<String, dynamic> json = jsonDecode(responseBody);
    List body = json["results"];
    List<SP> posts = body
        .map(
          (dynamic item) => SP.fromJson(item),
        )
        .toList();
    return posts;
  }
}
