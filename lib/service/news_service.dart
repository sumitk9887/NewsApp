import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model_list.dart';
import 'package:news_app/view/headlines_screen.dart';
import '../constants/constants.dart';
import '../models/article.dart';
import '../models/news_model.dart';

class NewsWebService extends GetxController{
  static var client = http.Client();

  static Future<List<Articles>?> fetchNews() async {
    var response = await client.get(Uri.parse(Constants.TOPHEADLINES));
    Map<String, dynamic> responseNews = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return articlesFromJson(response.body);

      NewsList.author = NewsModel.fromMap(responseNews).author;
      Get.to(Headline());
      
    } else {
      return null;
    }
  }
}
