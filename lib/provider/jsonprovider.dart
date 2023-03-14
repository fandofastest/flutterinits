import 'dart:convert';

import '../config.dart';
import 'package:http/http.dart' as http;

class JsonProvider{
  static Future<String> getJsonDetails () async {
    final response = await http.get(Uri.parse(Config.jsonurl));
    final extractedData = json.decode(response.body)['keywords'] as String;


    return extractedData;
  }

}