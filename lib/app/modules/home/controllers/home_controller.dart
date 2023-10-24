import 'package:get/get.dart';
import 'package:section7/app/data/product_model.dart';

class HomeController extends GetxController {
  var products = <Product>[].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    products.addAll([
      Product(
          id: 1,
          title: "Cool blue white jackets",
          price: 350,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "Men's jackets",
          image: "assets/images/1.png",
          rating: Rating(rate: 4.0, count: 70)),
      Product(
          id: 2,
          title: "Black and white jackets",
          price: 350,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "Men's jackets",
          image: "assets/images/2.png",
          rating: Rating(rate: 4.0, count: 90)),
      Product(
          id: 3,
          title: "Beige and black jackets",
          price: 950,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "Women's jackets",
          image: "assets/images/3.png",
          rating: Rating(rate: 4.0, count: 50)),
      Product(
          id: 4,
          title: "Black jackets",
          price: 800,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "Women's jackets",
          image: "assets/images/4.png",
          rating: Rating(rate: 4.0, count: 65)),
      Product(
          id: 5,
          title: "Black white jackets",
          price: 600,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "Women's jackets",
          image: "assets/images/5.png",
          rating: Rating(rate: 4.0, count: 54)),
      Product(
          id: 6,
          title: "Brown jackets",
          price: 900,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "Women's jackets",
          image: "assets/images/6.png",
          rating: Rating(rate: 4.0, count: 44)),
    ]);
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
