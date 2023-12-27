import 'package:ecommerce/data/db/sqlite_manager.dart';
import 'package:ecommerce/data/db/sqlite_manager_impl.dart';
import 'package:ecommerce/services/fcm.dart';
import 'package:ecommerce/services/localNotification.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SQliteManager>(() => SQLiteManagerImpl(),
        tag: (SQliteManager).toString(),
        fenix: true
    );

    Get.putAsync(() async => LocalNotificationService(),
    tag: (LocalNotificationService).toString(),
    permanent: true

    );
    Get.putAsync(() async => FirebaseService(),
        tag: (FirebaseService).toString(),
        permanent: true

    );


  }

}