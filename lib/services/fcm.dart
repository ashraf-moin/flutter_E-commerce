import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  final FirebaseMessaging _fcmMessaging = FirebaseMessaging.instance;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fmcNotification();
  }


  void fmcNotification() async {
    await _fcmMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );
  }
}
