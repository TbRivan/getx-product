import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  late TextEditingController name;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    name = TextEditingController();
  }

  @override
  void onClose() {
    name.dispose();
  }
}
