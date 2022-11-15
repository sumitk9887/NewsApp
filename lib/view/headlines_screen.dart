import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';

class Headline extends StatelessWidget {
  Headline({super.key});
  final NewsController _newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title: const Text("HEADLINES"),
        centerTitle: true,
      ),
      body: Obx(() => _newsController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _newsController.articles.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Image.network(
                        _newsController.articles[index].urlToImage.toString(),
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Text Message',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0),
                        )),
                  ],
                );
              })),
    );
  }
}
