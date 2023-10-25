import 'package:get/get.dart';

import '../../../data/product_model.dart';
import '../../../data/service_api.dart';

class HomeController extends GetxController {
  RxList<Product> listProduct = <Product>[].obs;

  final ServiceApi serviceApi = ServiceApi();

  Future<List<Product>> loadProduct() async {
    return listProduct.value = await serviceApi.getProduct();
  }

  Future<void> deleteUser(Product product) async {
    try {
      await serviceApi.deleteProduct(product.id.toString());
      Get.snackbar('Success', 'Product berhasil dihapus');
    } catch (e) {
      print(e);
    }
  }
}

class ProductController extends GetxController {
  //TODO: Implement ProductController

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
