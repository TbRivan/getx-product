import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_product/app/modules/home/views/item_view.dart';
import 'package:getx_product/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Product'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.ADD),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Obx(
        () => controller.products.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, i) {
                  final data = controller.products[i];
                  return ItemView(data);
                },
              ),
      ),
    );
  }
}
