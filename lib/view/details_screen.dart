// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class Details extends StatelessWidget {
  final NewsController newsController;
  final index;
  const Details({super.key, this.index, required this.newsController});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipRRect(
              // borderRadius: BorderRadius.circular(10),
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
              // borderRadius: BorderRadius.circular(10)
            ),
          ),
          Positioned(
            bottom: 9,
            left: 5,
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text(
                        newsController.articles[index].title.toString(),
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        // ignore: prefer_const_constructors
                        style: GoogleFonts.robotoSlab(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xfff2f2f2),
                          fontSize: 29.sp,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            newsController.articles[index].author.toString(),
                            textAlign: TextAlign.start,
                            style: GoogleFonts.robotoSlab(
                              color: const Color(0xffbababa),
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            DateFormat("yyyy-MM-dd").format(DateTime.parse(
                                newsController.articles[index].publishedAt
                                    .toString())),
                            style: GoogleFonts.robotoSlab(
                              color: const Color(0xffbababa),
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      newsController.articles[index].description.toString(),
                      textAlign: TextAlign.start,
                      style: GoogleFonts.robotoSlab(
                        color: const Color(0xffbababa),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}



