import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Pesan diterima di background: ${message.notification?.title}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationHandler(),
    );
  }
}

class NotificationHandler extends StatefulWidget {
  @override
  _NotificationHandlerState createState() => _NotificationHandlerState();
}

class _NotificationHandlerState extends State<NotificationHandler> {
  final FirebaseMessagingHandler _firebaseHandler = FirebaseMessagingHandler();

  @override
  void initState() {
    super.initState();
    _firebaseHandler.initPushNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Pesan diterima di foreground: ${message.notification?.title}");
      _showNotificationDialog(
          message.notification?.title, message.notification?.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Pesan ketika notifikasi di klik: ${message.notification?.title}");
      _showNotificationDialog(
          message.notification?.title, message.notification?.body);
    });
  }

  void _showNotificationDialog(String? title, String? body) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title ?? 'No Title'),
          content: Text(body ?? 'No Body'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FCM Notifikasi")),
      body: Center(
        child: Text("Aplikasi Notifikasi"),
      ),
    );
  }
}

class FirebaseMessagingHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initPushNotification() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('Izin yang diberikan pengguna: ${settings.authorizationStatus}');

    _firebaseMessaging.getToken().then((token) {
      print('FCM Token: $token');
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print("Pesan saat aplikasi terminated: ${message.notification?.title}");
      }
    });
  }
}
