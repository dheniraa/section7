import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:section7/app/data/product_model.dart';
import 'package:section7/app/modules/product/controllers/product_controller.dart';
import '../../../routes/app_pages.dart';

class ProductView extends GetView<ProductController> {
  ProductView({Key? key}) : super(key: key);

  Product displayProduct = Get.arguments ?? Product();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/logo.png'),
            Text(
              'Fake Shop',
              style:
                  TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Center(
                child: Container(
                  height: 200,
                  child: Image.network(
                    displayProduct.image ?? '',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                displayProduct.title ?? '',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    Icons.star,
                    color: i < (displayProduct.rating?.rate ?? 0).floor()
                        ? Colors.yellow
                        : Colors.grey,
                    size: 18,
                  ),
                SizedBox(width: 5),
                Text(
                  displayProduct.rating?.rate?.toStringAsFixed(1) ?? '',
                ),
                SizedBox(width: 3),
                Text("|"),
                SizedBox(width: 3),
                Text(
                  displayProduct.rating?.count?.toStringAsFixed(1) ?? '',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "\$${displayProduct.price.toString()}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${displayProduct.description}",
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 175,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.sell,
                  size: 19,
                  color: Colors.purple,
                ),
                label: Text(
                  "${displayProduct.category}",
                  style: TextStyle(color: Colors.purple),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  side: BorderSide(color: Colors.purple, width: 0.8),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              heroTag: 'edit',
              onPressed: () {
                Get.toNamed(Routes.ADD_PRODUCT, arguments: displayProduct);
              },
              backgroundColor: Colors.yellow,
              child: Icon(Icons.edit),
            ),
          ),
          FloatingActionButton(
            heroTag: 'delete',
            onPressed: () {
              Get.dialog(
                Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Color(0xffF2D2EB),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 10),
                                child: Icon(
                                  Icons.help_outline,
                                  size: 100,
                                  color: Color(0xff802c6e),
                                ),
                              ),
                            ),
                            SizedBox(height: 17),
                            Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                'Are you sure?',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xff802c6e),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                'Do you really want to delete this product? You will not be able to undo this action!',
                                style: TextStyle(
                                  fontFamily: 'Poppins Regular',
                                  color: Color(0xff802c6e),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: BorderSide(
                                      color: Color(0xff802c6e),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    fixedSize: Size(100, 15),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      fontFamily: 'Poppins Regular',
                                      color: Color(0xff802c6e),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff802c6e),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    fixedSize: Size(100, 15),
                                  ),
                                  onPressed: () {
                                    controller.deleteProduct(displayProduct);
                                    Get.back();
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontFamily: 'Poppins Regular',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            backgroundColor: Colors.red,
            child: Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
