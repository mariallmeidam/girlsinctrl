import 'dart:convert';

import 'package:tcc_girls_in_ctrl/constants.dart';
import "package:http/http.dart" as http;

// ------ Get feed Instagram ------
Future<List<dynamic>> getInstagram() async {
  final response = await http.get(Uri.parse(getInstagramURL));

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);
    return parsed['data'];
  } else {
    throw Exception('Falha ao obter o feed do Instagram');
  }
}
