import 'dart:convert';

import 'package:tcc_girls_in_ctrl/constants.dart';
import "package:http/http.dart" as http;

// ------ Notícias ------
Future<List<dynamic>> getVagas() async {
  final response = await http.get(Uri.parse(jobsURL));

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);
    return parsed;
  } else {
    throw Exception('Falha ao obter as notícias do feed RSS');
  }
}
