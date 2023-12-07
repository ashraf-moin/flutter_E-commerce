import 'package:ecommerce/data/db/sqlite_manager.dart';
import 'package:ecommerce/data/db/sqlite_manager_impl.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SQliteManager>(() => SQLiteManagerImpl(),
        tag: (SQliteManager).toString(),
        fenix: true
    );
  }

}