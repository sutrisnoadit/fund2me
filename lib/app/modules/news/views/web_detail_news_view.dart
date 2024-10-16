import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import '../models/newsArticles.dart';
import '../controllers/news_controller.dart';
class WebDetailNewsView extends GetView<NewsController>{
  final Post argNewsData1;
  const WebDetailNewsView({super.key, required this.argNewsData1} ) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WebViewWidget(controller: controller.webViewController(argNewsData1.link)),
      ),
    );
  }
}
