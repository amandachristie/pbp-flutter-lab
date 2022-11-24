import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';

Future<List<MyWatchList>> fetchWatchlist() async {
  var url = Uri.parse(
      'http://tugas2-pbp-amandachristie.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchList
  List<MyWatchList> listMyWatch = [];
  for (var d in data) {
    if (d != null) {
      listMyWatch.add(MyWatchList.fromJson(d));
    }
  }

  return listMyWatch;
}
