import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:section7/app/data/service_api.dart';

class AddProductController extends GetxController {
  ServiceApi serviceApi = ServiceApi();

  TextEditingController titleC = TextEditingController();
  TextEditingController categoryC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();

  RxString imagePath = ''.obs;
  final ImagePicker picker = ImagePicker();
  XFile? image;

  Future<void> selectImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) imagePath.value = image!.path;
  }

  bool checkIsDouble(String? text) {
    try {
      double.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(Product displayproduct) {
    titleC.text = displayproduct.title ?? '';
    categoryC.text = displayproduct.category ?? '';
    priceC.text = (displayproduct.price ?? '').toString();
    descriptionC.text = displayproduct.description ?? '';
    imagePath.value = displayproduct.image ?? '';
  }

  controllerToModel(Product displayproduct) {
    displayproduct.title = titleC.text;
    displayproduct.category = categoryC.text;
    displayproduct.price = double.tryParse(priceC.text);
    displayproduct.description = descriptionC.text;
    displayproduct.image = imagePath.value;
    return Product;
  }

  Future storeUser(Product displayproduct, bool isUpdate) async {
    try {
      displayproduct = controllerToModel(displayproduct);
      isUpdate == false
          ? await serviceApi.createProduct(displayproduct)
          : await serviceApi.updateProduct(displayproduct);
      Get.back();
      Get.snackbar('Success', 'Product berhasil disimpan');
    } catch (e) {
      print(e.toString());
    }
  }
}
