import 'package:get/get.dart';
import 'package:local_database/controllers/HomeController.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => HomeController());
  }
}