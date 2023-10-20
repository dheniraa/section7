import 'package:get/get.dart';

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
          price: 900,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "women's",
          image: "assets/images/1.png",
          rating: Rating(rate: 4.0, count: 23)),
      Product(
          id: 2,
          title: "Cool blue white jackets",
          price: 900,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "women's",
          image: "assets/images/2.png",
          rating: Rating(rate: 4.0, count: 23)),
      Product(
          id: 3,
          title: "Cool blue white jackets",
          price: 900,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "women's",
          image: "assets/images/3.png",
          rating: Rating(rate: 4.0, count: 23)),
      Product(
          id: 4,
          title: "Cool blue white jackets",
          price: 900,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "women's",
          image: "assets/images/4.png",
          rating: Rating(rate: 4.0, count: 23)),
      Product(
          id: 5,
          title: "Cool blue white jackets",
          price: 900,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "women's",
          image: "assets/images/5.png",
          rating: Rating(rate: 4.0, count: 23)),
      Product(
          id: 6,
          title: "Cool blue white jackets",
          price: 900,
          description:
              "Polyvore featuring outerwear, jackets, capes, coats, trench cape, brown trench coat, trench coat cape, brown cape and burberry trenchcoat",
          category: "women's",
          image: "assets/images/6.png",
          rating: Rating(rate: 4.0, count: 23)),
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

class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
}

class Rating {
  double rate;
  int count;

  Rating({
    this.rate,
    this.count,
  });
}
