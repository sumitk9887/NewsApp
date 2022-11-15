import 'package:get/get.dart';
import 'package:news_app/models/article.dart';
import '../service/news_service.dart';

class NewsController extends GetxController {

  var articles = < Articles > [].obs;
  
  var isLoading = true.obs;
  
  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      isLoading(true);
      var articlesTemp = await NewsWebService.fetchNews();
      if (articlesTemp != null) {
        articles(articlesTemp);
      }

    } finally {
      isLoading(false);
    }
  }
}