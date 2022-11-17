// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/service/news_service.dart';
import 'package:news_app/view/details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Headline extends StatelessWidget {
  Headline({super.key});
  final NewsController _newsController = Get.put(NewsController());
  NewsWebService news = Get.find();
    
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: const Color(0xFF464646),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title: Text("HEADLINES",
            style: GoogleFonts.robotoSlab(
                fontWeight: FontWeight.bold, fontSize: 29.sp)),
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
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 18, 12, 18),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(
                                  index: index,
                                  newsController: _newsController,
                                )),
                      );
                    },
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              _newsController.articles[index].urlToImage
                                  .toString(),
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            )),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              color: Colors.black45.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10)),
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
                                        _newsController.articles[index].title
                                            .toString(),
                                        textAlign: TextAlign.start,
                                        maxLines: 3,
                                        style: GoogleFonts.robotoSlab(
                                          color: const Color(0xfff2f2f2),
                                          fontSize: 20.sp,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _newsController
                                                    .articles[index].author
                                                    ?.toString() ==
                                                null
                                            ? Text(
                                                "NA",
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.robotoSlab(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xffbababa),
                                                  fontSize: 12.sp,
                                                ),
                                              )
                                            : Text(
                                                _newsController
                                                    .articles[index].author
                                                    .toString(),
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.robotoSlab(
                                                  fontWeight: FontWeight.bold,
                                                  color:
                                                      const Color(0xffbababa),
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                      ),
                                      SizedBox(
                                        width: 18,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 35),
                                        child: Text(
                                          DateFormat("yyyy-MM-dd").format(
                                              DateTime.parse(_newsController
                                                  .articles[index].publishedAt
                                                  .toString())),
                                          style: GoogleFonts.robotoSlab(
                                            color: const Color(0xffbababa),
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
