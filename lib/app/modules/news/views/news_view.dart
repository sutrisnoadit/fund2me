import 'package:flutter/material.dart';
import 'package:fund2me1/app/modules/components/card.dart';

import 'package:get/get.dart';


import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewsView'),
        centerTitle: true,
      ),
      body:  Center(
        child: Obx((){
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator(),);
          }
          final newsData = controller.newsData.value;
          if (newsData == null || newsData.data.posts.isEmpty) {
            return Center(child: Text("Tidak Ada Berita"));
          }
          return ListView.builder(
            itemCount: newsData.data.posts.length,
            itemBuilder: (context,index){
                var content = newsData.data.posts[index];
                return CardArticle(argNewsData: content); 
          });
        })
      ),
    );
  }
}
