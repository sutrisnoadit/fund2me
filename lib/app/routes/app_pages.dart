import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/donation/bindings/donation_binding.dart';
import '../modules/donation/views/donation_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kamera/bindings/kamera_binding.dart';
import '../modules/kamera/views/kamera_view.dart';
import '../modules/maps/bindings/maps_binding.dart';
import '../modules/maps/views/maps_view.dart';
import '../modules/microphone/bindings/microphone_binding.dart';
import '../modules/microphone/views/microphone_view.dart';
import '../modules/modul4/bindings/modul4_binding.dart';
import '../modules/modul4/views/modul4_view.dart';
import '../modules/my_address/bindings/my_address_binding.dart';
import '../modules/my_address/views/my_address_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/news/views/web_detail_news_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.NEWSDETAIL,
      page: () => WebDetailNewsView(argNewsData1: Get.arguments),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.DONATION,
      page: () => DonationView(),
      binding: DonationBinding(),
    ),
    GetPage(
      name: _Paths.MY_ADDRESS,
      page: () => const MyAddressView(),
      binding: MyAddressBinding(),
    ),
    GetPage(
      name: _Paths.MODUL4,
      page: () => const Modul4View(),
      binding: Modul4Binding(),
    ),
    GetPage(
      name: _Paths.KAMERA,
      page: () => const KameraView(),
      binding: KameraBinding(),
    ),
    GetPage(
      name: _Paths.MICROPHONE,
      page: () => const MicrophoneView(),
      binding: MicrophoneBinding(),
    ),
    GetPage(
      name: _Paths.MAPS,
      page: () => const MapsView(),
      binding: MapsBinding(),
    ),
  ];
}
