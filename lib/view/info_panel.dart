// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  final NewsController newsController;
  final index;
  const InfoPanel({super.key, required this.newsController, this.index});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 9, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black54.withOpacity(0.3), shape: BoxShape.circle),
            child: IconButton(
              iconSize: 31.50,
              icon: const Icon(Icons.arrow_back_outlined),
              color: const Color(0xfff2f2f2),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black54.withOpacity(0.3), shape: BoxShape.circle),
            child: IconButton(
              iconSize: 31.50,
              icon: const Icon(Icons.info_outline),
              color: const Color(0xfff2f2f2),
              onPressed: () async {
                String url = newsController.articles[index].url.toString();
                if (await launch(url)) {
                  await launch(url,
                      enableJavaScript: true,
                      enableDomStorage: true,
                      webOnlyWindowName: '_self');
                } else {
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
