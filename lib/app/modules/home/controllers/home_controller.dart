import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_product/app/data/providers/product_provider.dart';

import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  var products = List<Product>.empty().obs;

  void dialogError(String msg) {
    Get.defaultDialog(
      title: "Something Wrong",
      content: Text(
        msg,
        textAlign: TextAlign.center,
      ),
    );
  }

  void add(String name) {
    if (name != '') {
      final date = DateTime.now().toIso8601String();
      ProductProvider().postProduct(name, date).then(
        (response) {
          final data = Product(
            id: response["name"],
            name: name,
            createdAt: date,
          );
          products.add(data);
          Get.back();
        },
      );
    } else {
      dialogError('Input any name');
    }
  }

  void delete(String id) {
    ProductProvider().deleteProduct(id).then(
      (value) {
        products.removeWhere((element) => element.id == id);
      },
    );
  }

  Product findById(String id) {
    return products.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name) {
    final data = findById(id);
    ProductProvider().editProduct(id, name).then(
      (value) {
        data.name = name;
        products.refresh();
        Get.back();
      },
    );
  }
}
