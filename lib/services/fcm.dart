import 'package:ecommerce/services/localNotification.dart';
import 'package:firebase_core/firebase_core.dart';
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


    var fmcToken = _fcmMessaging.getToken();
    print(fmcToken);

    RemoteMessage? initMessage = await _fcmMessaging.getInitialMessage();

    if(initMessage != null){_fcmlistener;}

    FirebaseMessaging.onMessage.listen(_fcmlistener);


    FirebaseMessaging.onMessageOpenedApp.listen(_fcmlistener);


    FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);




  }


  void _fcmlistener(RemoteMessage message){
    if(message.notification != null){
      String title = message.notification!.title!;
      String body = message.notification!.body!;
      LocalNotificationService.loadNotification(title: title, body: body);
    }
  }


}


@pragma('vm:entry-point')
Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  if(message.notification != null){
    String title = message.notification!.title!;
    String body = message.notification!.body!;
    LocalNotificationService.loadNotification(title: title, body: body);
  }
}