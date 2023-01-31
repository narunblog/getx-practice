import 'package:get/get.dart';

class HomeController extends GetxController {
  var email = ''.obs;
  // var status = 'online'.obs;
  // var followers = 50.obs;

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   // ever(status, (_) {
  //   //   print('status value changed');
  //   // });

  //   // everAll([status, followers], (_) {
  //   //   print('status or followers value changed');
  //   // });

  //   once(status, (_) {
  //     print('status changed and function called only once');
  //   });

  //   super.onInit();
  // }

  // void updateStatus(String newStatus) {
  //   status.value = newStatus;
  //   //update(['status_widget']);
  // }

  void updateEmail(String newEmail) {
    email.value = newEmail;
    //update(['status_widget']);
  }
}
