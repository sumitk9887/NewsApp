// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/view/bottom_details.dart';
import 'package:news_app/view/info_panel.dart';

class Details extends StatelessWidget {
  final NewsController newsController;
  final index;
  const Details({super.key, this.index, required this.newsController});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            ClipRRect(
                child: Image.network(
              newsController.articles[index].urlToImage.toString(),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            )),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black45.withOpacity(0.4),
              ),
            ),
            InfoPanel(
              newsController: newsController,
              index: index,
            ),
            Positioned(
              bottom: 9,
              left: 5,
              child: BottomDetails(newsController: newsController,index: index,)
            ),
          ],
        ),
      ),
    );
  }
}
