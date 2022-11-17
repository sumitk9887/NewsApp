import 'package:http/http.dart' as http;
import '../constants/constants.dart';
import '../models/article.dart';

class NewsWebService {

  static var client = http.Client();

  static Future<List<Articles>?> fetchNews() async {

    var response = await client.get(Uri.parse(Constants.TOPHEADLINES));

    if(response.statusCode == 200) {
      return articlesFromJson(response.body);
    } else {
      return null;
    }

  }
  
}