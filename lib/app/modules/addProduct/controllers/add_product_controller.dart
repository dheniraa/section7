import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/product_model.dart';
import 'package:section7/app/data/service_api.dart';

class FormController extends GetxController {
  ServiceApi serviceApi = ServiceApi();

  TextEditingController titleC = TextEditingController();
  TextEditingController categoryC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();

  bool checkIsDouble(String? text) {
    try {
      double.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(Product product) {
    titleC.text = product.title ?? '';
    categoryC.text = product.category ?? '';
    priceC.text = (product.price ?? '').toString();
    descriptionC.text = product.description ?? '';
  }

  controllerToModel(Product product) {
    product.title = titleC.text;
    product.category = categoryC.text;
    product.price = double.tryParse(priceC.text);
    product.description = descriptionC.text;
    return Product;
  }

  Future storeUser(Product product, bool isUpdate) async {
    try {
      product = controllerToModel(product);
      isUpdate == false
          ? await serviceApi.createProduct(product)
          : await serviceApi.updateProduct(product);
      Get.back();
      Get.snackbar('Success', 'Product berhasil disimpan');
    } catch (e) {
      print(e.toString());
    }
  }
}


class AddProductController extends GetxController {
  //TODO: Implement AddProductController
  

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}


