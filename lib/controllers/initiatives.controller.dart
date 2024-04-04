import 'dart:convert';

import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/gets.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/likeinitiatives.models.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/models/initiative.models.dart';
import "package:http/http.dart" as http;

// ------ Get Initiatives ------
Future<List<dynamic>> getInitiatives() async {
  final response = await http.get(Uri.parse(initiativeURL));

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);
    return parsed;
  } else {
    throw Exception('Falha ao obter as iniciativas');
  }
}

// ------ Like_initiatives ------
Future<ApiResponse> like_initiatives(
    String name, String subtitle, String link, String image) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getToken();
    final response = await http.post(Uri.parse(likeinitiativesURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'name': name,
      'subtitle': subtitle,
      'link': link,
      'image': image,
    });

    print(response.statusCode);

    if (response.statusCode == 200) {
      // Adição bem-sucedida
      apiResponse.data = Like_initiatives.fromJson(jsonDecode(response.body));
    } else {
      // Lidar com erros na adição
      apiResponse.error = 'Erro ao adicionar like';
    }
  } catch (e) {
    // Lidar com erros de conexão
    apiResponse.error = 'Erro de conexão';
  }

  return apiResponse;
}

// ------ Get likes in Initiatives ------
Future<ApiResponse> getLikeInitiatives() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(getLikeInitiativesURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['likes']
            .map((p) => Like_initiatives.fromJson(p))
            .toList();
        print(apiResponse.data);
        apiResponse.data as List<dynamic>;
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// ------ Delete Initiatives in News ------
Future<ApiResponse> deleteLikeIni(int iniId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.delete(Uri.parse('$likeinitiativesURL/$iniId'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

// ------ Search Likes in Initiatives ------
Future<ApiResponse> searchLikeIni(String name) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse('$likeinitiativesURL/$name'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
        break;
      default:
        apiResponse.error = somethingWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}
