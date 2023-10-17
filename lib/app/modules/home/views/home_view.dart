import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView {
  final List<Map<String, String>> items = [
    {
      'title': 'Item 1',
      'description': 'Description 1',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Item 2',
      'description': 'Description 2',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Item 3',
      'description': 'Description 3',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Item 4',
      'description': 'Description 4',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Item 5',
      'description': 'Description 5',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Item 6',
      'description': 'Description 6',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Item 7',
      'description': 'Description 7',
      'image': 'https://via.placeholder.com/150'
    },
    {
      'title': 'Item 8',
      'description': 'Description 8',
      'image': 'https://via.placeholder.com/150'
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
                itemBuilder: (context, index) => Container(
                  color: Color.fromARGB(
                    255,
                    60 + Random().nextInt(151),
                    60 + Random().nextInt(151),
                    60 + Random().nextInt(151),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePaths[index % imagePaths.length],
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(height: 10),
                      Text(
                        items[index]['title'],
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        items[index]['description'],
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
