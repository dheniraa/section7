import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:section7/app/modules/product/views/product_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView {
  final List<Map<String, String>> items = [
    {
      'title': 'Jacket',
      'description': 'Description 1',
    },
    {
      'title': 'Item 2',
      'description': 'Description 2',
    },
    {
      'title': 'Item 3',
      'description': 'Description 3',
    },
    {
      'title': 'Item 4',
      'description': 'Description 4',
    },
    {
      'title': 'Item 5',
      'description': 'Description 5',
    },
    {
      'title': 'Item 6',
      'description': 'Description 6',
    },
    {
      'title': 'Item 7',
      'description': 'Description 7',
    },
    {
      'title': 'Cotton-gabardine trench cape',
      'description': '900',
    },
  ];

  final List<String> imagePaths = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
  ];

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
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 40,
                  child: TextField(
                    onChanged: (search) {},
                    decoration: InputDecoration(
                      hintText: "Search",
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                margin: EdgeInsets.all(10),
                height: 40,
                width: 100,
                child: TextField(
                  onChanged: (search) {},
                  decoration: InputDecoration(
                    hintText: "Filter",
                    contentPadding: EdgeInsets.all(12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: Icon(Icons.filter),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  // onTap: () {
                  //   Get.to(ProductView(title: items[index]['title']));
                  // },
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          imagePaths[index % imagePaths.length],
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(height: 10),
                        Text(
                          items[index]['title'],
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          items[index]['description'],
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.only(right: 5),
        child: SizedBox(
          width: 190,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              // Aksi ketika tombol "Add New Product" ditekan
              // Contoh: Navigasi ke halaman tambah produk
              // Get.to(AddProductView());
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add New Product',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(width: 5),
                Icon(Icons.add_circle_outline_outlined),
              ],
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
