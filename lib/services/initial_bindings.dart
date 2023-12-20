import 'package:elibrary/controller/book_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BookController());
  }
}
