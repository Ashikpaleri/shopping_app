import 'dart:convert';
import 'package:http/http.dart';

Future<void> readProductJson() async {
  Uri uri = Uri.parse("http://omanphone.smsoman.com/api/productdetails?id=5");
  try {
    var response = await get(uri);
    final data = await json.decode(response.body);
    return data;
  } catch (e) {
    return null;
  }
}
