import 'dart:convert';

import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/gets.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/likenews.models.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import "package:http/http.dart" as http;

// ------ Notícias ------
Future<List<dynamic>> fetchNoticias() async {
  final response = await http.get(Uri.parse(newsURL));

  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);
    return parsed;
  } else {
    throw Exception('Falha ao obter as notícias do feed RSS');
  }
}

// ------ Like-news ------
Future<ApiResponse> like_news(
    String title, String description, String link, String image) async {
  ApiResponse apiResponse = ApiResponse();

  try {
    String token = await getToken();
    final response = await http.post(Uri.parse(likenewsURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'title': title,
      'description': description,
      'link': link,
      'image': image,
    });

    print(response.statusCode);

    if (response.statusCode == 200) {
      // Adição bem-sucedida
      apiResponse.data = Like_news.fromJson(jsonDecode(response.body));
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

// ------ Get Likes in News ------
Future<ApiResponse> getLikeNews() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(getLikeNewsURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['likes']
            .map((p) => Like_news.fromJson(p))
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

// ------ Delete Like in News ------
Future<ApiResponse> deleteLikeNews(int newsId) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.delete(Uri.parse('$likenewsURL/$newsId'),
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

// ------ Search Likes in News ------
Future<ApiResponse> searchLikeNews(String name) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse('$likenewsURL/$name'), headers: {
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

// ------ Search News with "Woman" ------
Future<ApiResponse> getNewsWoman() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(getWomansNewsURL), headers: {
      'Accept': 'application/json',
    });

    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['news']
            .map((p) => Like_news.fromJson(p))
            .toList();
        print(apiResponse.data);
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
