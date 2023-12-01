// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_product/app/modules/home/controllers/home_controller.dart';

import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  final homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final data = homeC.findById(Get.arguments);
    controller.name.text = data.name!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              autocorrect: false,
              controller: controller.name,
              decoration: const InputDecoration(
                labelText: "Product Name",
                hintText: 'Input Product name here...',
                border: OutlineInputBorder(),
              ),
              onEditingComplete: () => homeC.edit(
                Get.arguments,
                controller.name.text,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () => homeC.edit(
                      Get.arguments,
                      controller.name.text,
                    ),
                child: const Text('Edit Product'))
          ],
        ),
      ),
    );
  }
}
