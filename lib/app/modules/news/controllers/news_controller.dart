import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import '../models/newsArticles.dart';
class NewsController extends GetxController {
  //TODO: Implement NewsController
  static const String _url = 'https://api-berita-indonesia.vercel.app/';
  static const String _provider = 'cnn';
  static const String _category = 'ekonomi';
  final count = 0.obs;
  RxBool isLoading = true.obs;
  Rx<newsArticles?> newsData = Rx<newsArticles?>(null);

  @override
  void onInit() async {
    await fetchAllNews();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> fetchAllNews() async{
    try {
        isLoading.value = true;
        final response = await http.get(Uri.parse(_url+'/'+_provider +'/'+_category));
        if(response.statusCode == 200){
          final jsonData = response.body;
          newsData.value = newsArticles.fromJson(jsonDecode(jsonData));
          // final tes = newsData.value;
          // print(tes?.data.posts[0].title);  
        }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }finally
    {
      isLoading.value = false;
    }
  
  }
  WebViewController webViewController(String url){
    return WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse(url));
  }
}
