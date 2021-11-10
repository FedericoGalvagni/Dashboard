// ignore_for_file: file_names
import "package:get/get.dart";

class CounterController extends GetxController {
  //variables that we want to take track off need to be observable .obs
  var counter = 0.obs;

  void increment() {
    counter++;
  }
}
