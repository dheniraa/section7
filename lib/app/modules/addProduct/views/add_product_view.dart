import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:section7/app/data/product_model.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  AddProductView({Key? key}) : super(key: key);
  Product displayProduct = Get.arguments ?? Product();

  final GlobalKey<FormState> formKey = GlobalKey();

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
                child: controller.imagePath.value.isNotEmpty
                    ? Image.file(
                        File((controller.imagePath.value)),
                        fit: BoxFit.contain,
                      )
                    : (displayProduct.image ?? '').isNotEmpty
                        ? Image.network(
                            displayProduct.image ?? '',
                            fit: BoxFit.contain,
                          )
                        : Image.asset(
                            'assets/images/form.png',
                            fit: BoxFit.cover,
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
                              labelText: "Product Name",
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
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DropdownButtonFormField<String>(
                          value: controller.categories.isNotEmpty
                              ? controller.categories
                              : '',
                          onChanged: (String? newValue) {
                            ({controller.categories = newValue ?? ''});
                          },
                          decoration: InputDecoration(
                            labelText: "Category",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff802c6e)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          items: [
                            "electronics",
                            "jewelery",
                            "men's clothing",
                            "women's clothing",
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: const TextStyle(
                                      fontFamily: 'Poppins Light',
                                      color: Color(0xff802c6e))),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: controller.priceC,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Price",
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
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
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
                  onPressed: () async {
                    formKey.currentState?.validate() == true
                        ? await controller.storeProduct(displayProduct,
                            (displayProduct.id != null) ? true : false)
                        : Get.snackbar('Error', 'Data tidak valid');
                  },
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
