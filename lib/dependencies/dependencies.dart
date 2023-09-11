import 'package:get/get.dart';

import '../controller/controller.dart';

//init the controller into the main function
Future<void> initializeDependencies() async {
  Get.put(UserController());
}

