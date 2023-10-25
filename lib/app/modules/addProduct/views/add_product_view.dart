import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:section7/app/data/product_model.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  AddProductView({Key? key}) : super(key: key);
  Product displayProduct = Get.arguments ?? Product();

  final AddProductController formController = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    controller.modelToController(displayProduct);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/logo.png'),
            Text(
              'Fake Store',
              style:
                  TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Container(
                child: controller.imagePath.value != ""
                    ? Container(
                        child: Image.file(File(controller.imagePath.value)))
                    : Container(
                        child: Image.asset(
                          'assets/images/form.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                width: 350,
                height: 200,
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(blurRadius: 2, color: Colors.grey)
                    ]),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: () async {
                  await controller.selectImage();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.purple, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Upload Image',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.image_rounded,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'Product Information',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: controller.titleC,
                          decoration: InputDecoration(
                            hintText: "Product Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: controller.categoryC,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.arrow_drop_down_rounded),
                            hintText: "Category",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: controller.priceC,
                          decoration: InputDecoration(
                            hintText: "Price",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.newline,
                          controller: controller.descriptionC,
                          decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 17),
                              labelText: "Description",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff802c6e)),
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
