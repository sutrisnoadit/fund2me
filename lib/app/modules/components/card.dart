import 'package:flutter/material.dart';
import 'package:fund2me1/app/modules/news/views/web_detail_news_view.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';
import '../news/models/newsArticles.dart';

class CardArticle extends StatelessWidget {
  final Post argNewsData;
  const CardArticle({Key? key, required this.argNewsData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: argNewsData.thumbnail?? argNewsData.thumbnail, // Use a fallback tag
          child: SizedBox(
            width: 100,
            height: 100,
            child: argNewsData.thumbnail != null
                ? Image.network(
                    argNewsData.thumbnail!,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: Colors.grey,
                    child: const Center(
                      child: Text(
                        'No Image',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          ),
        ),
        title: Text(
          argNewsData.title,
        ),
       
        onTap: () {
          // WebDetailNewsView(argNewsData1: argNewsData);
          Get.toNamed(Routes.NEWSDETAIL, arguments: argNewsData);
        },
      ),
    );
  }
}
