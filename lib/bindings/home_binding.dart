import 'package:get/get.dart';
import 'package:getxpractic/controller/homeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    //Get.put<HomeController>(HomeController(), permanent: true);
    Get.lazyPut(() => HomeController());
  }
}
