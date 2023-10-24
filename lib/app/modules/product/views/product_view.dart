import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:section7/app/data/product_model.dart';
import '../../../routes/app_pages.dart';

class ProductView extends StatelessWidget {
  final Product product;

  ProductView({Key key, this.product}) : super(key: key);

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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Center(
                    child: Container(
                      height: 200,
                      child: Image.asset(
                        displayProduct.image,
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    displayProduct.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: List.generate(5, (index) {
                    if (index < 4) {
                      return Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      );
                    } else {
                      return Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          Text(
                            "${displayProduct.rating}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      );
                    }
                  }),
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
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${displayProduct.description}",
                    style: TextStyle(fontSize: 16),
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
            Positioned(
              bottom: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(Routes.ADD_PRODUCT, arguments: product);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(217, 255, 255, 1),
                        shape: CircleBorder(),
                        minimumSize: Size(50, 50),
                      ),
                      child: Icon(Icons.edit, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Container(
                                color: Color.fromARGB(255, 214, 158, 224),
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                child: Icon(
                                  Icons.help_outline_rounded,
                                  size: 70,
                                  color: Color.fromARGB(135, 130, 20, 149),
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Are you sure?",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Do you really want to delete this product? You will not be able to undo this action!",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.purple,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          minimumSize: Size(80, 35),
                                        ),
                                        child: Text("No",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                      SizedBox(width: 10),
                                      TextButton(
                                        onPressed: () {
                                          // Perform delete operation here
                                          Navigator.of(context).pop();
                                        },
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.purple,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                          ),
                                          minimumSize: Size(80, 35),
                                        ),
                                        child: Text("Yes",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 228, 16, 1),
                        shape: CircleBorder(),
                        minimumSize: Size(50, 50),
                      ),
                      child: Icon(Icons.delete_forever, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
