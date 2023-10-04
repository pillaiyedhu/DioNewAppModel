import 'dart:convert';

import 'package:day12_newapp_using_dio_json/models/NewsAppApiModel.dart';
import 'package:dio/dio.dart';

class NewsApiService {
  // String newsKey = 'e4dcfafbe05247a098058d62e76f12a2';
  String url =
      'https://newsapi.org/v2/everything?q=tesla&from=2023-07-30&sortBy=publishedAt&apiKey=e4dcfafbe05247a098058d62e76f12a2';

  Dio dio = Dio();

  NewsApiService() {
    dio = Dio();
  }

  Future<List<Article>> getDetails() async {
    try {
      Response response = await dio.get(url);
      print('tryyyy');
      if (response.statusCode == 200) {
        List result = jsonDecode(response.data);
        //NewsAppApiModel apiModel = NewsAppApiModel.fromJson(response.data);
        return result.map((e) => Article.fromJson(e)).toList();
      } else {
        throw Exception(response.statusCode);
      }
    } on DioException catch (e) {
      throw Exception(e);
    }
  }
}
