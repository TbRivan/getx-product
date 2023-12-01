import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_product/app/data/models/product_model.dart';
import 'package:getx_product/app/modules/home/controllers/home_controller.dart';
import 'package:getx_product/app/routes/app_pages.dart';

class ItemView extends GetView<HomeController> {
  final Product data;
  const ItemView(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.toNamed(Routes.UPDATE, arguments: data.id!),
      leading: const CircleAvatar(),
      title: Text(data.name!),
      subtitle: Text(data.createdAt!),
      trailing: IconButton(
        icon: const Icon(Icons.delete_forever),
        onPressed: () => controller.delete(data.id!),
      ),
    );
  }
}
