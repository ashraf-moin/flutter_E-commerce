import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class LocalNotificationService extends GetxService {
  static final _notificationPlugin = FlutterLocalNotificationsPlugin();

  static void notificationInitialize() {
    var initAndroidSettings =
        const AndroidInitializationSettings("@mipmap/launcher_icon");
    var initIosSettings = const DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initSettings = InitializationSettings(
      android: initAndroidSettings,
      iOS: initIosSettings,
    );
    _notificationPlugin.initialize(initSettings);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    notificationInitialize();
  }

  static void loadNotification(
      {required String title, required String body}) async {
    try {
      final id = DateTime.now().microsecond;
      NotificationDetails notificationDetails = const NotificationDetails(
          android: AndroidNotificationDetails(
        'local-notification',
        'Todo Notification',
        importance: Importance.max,
        priority: Priority.high,
      ));

      await _notificationPlugin.show(id, title, body, notificationDetails);
    } on Exception catch (error) {
      throw error.toString();
    }
  }
}
