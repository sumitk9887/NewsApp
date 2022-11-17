// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomDetails extends StatelessWidget {
  final NewsController newsController;
  final index;
  const BottomDetails({super.key, required this.newsController, this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  child:
                      newsController.articles[index].author?.toString() == null
                          ? Text(
                              "NA",
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: GoogleFonts.robotoSlab(
                                color: const Color(0xffbababa),
                                fontSize: 20.sp,
                              ),
                            )
                          : Text(
                              newsController.articles[index].author.toString(),
                              textAlign: TextAlign.start,
                              maxLines: 3,
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
                        newsController.articles[index].publishedAt.toString())),
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
            Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                newsController.articles[index].description.toString(),
                textAlign: TextAlign.start,
                style: GoogleFonts.robotoSlab(
                  color: const Color(0xffbababa),
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ));
    
  }
}
