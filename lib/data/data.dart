import 'package:flutter/material.dart';

import 'package:shop_app/models/models.dart';

List<Product> getProducts() {
  String dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";

  return [
    Product(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/png/bag_1.png",
      color: Color(0xFF3D82AE),
      colors: [0xFF3D82AE, 0xFFF8C078, 0xFFA29B9B],
    ),
    Product(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/images/png/bag_2.png",
      color: Color(0xFFD3A984),
      colors: [0xFFD3A984, 0xFFF8C078, 0xFFA29B9B],
    ),
    Product(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/images/png/bag_3.png",
      color: Color(0xFF989493),
      colors: [0xFF989493, 0xFFF8C078, 0xFFA29B9B],
    ),
    Product(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/images/png/bag_4.png",
      color: Color(0xFFE6B398),
      colors: [0xFFE6B398, 0xFFF8C078, 0xFFA29B9B],
    ),
    Product(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/png/bag_5.png",
      color: Color(0xFFFB7883),
      colors: [0xFFFB7883, 0xFFF8C078, 0xFFA29B9B],
    ),
    Product(
      id: 6,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/png/bag_6.png",
      color: Color(0xFFAEAEAE),
      colors: [0xFFAEAEAE, 0xFFF8C078, 0xFFA29B9B],
    ),
  ];
}

Future<List<Category>> getCategories() async {
  return [
    Category(id: 1, title: "Hand bag"),
    Category(id: 1, title: "Jewellery"),
    Category(id: 1, title: "Footwear"),
    Category(id: 1, title: "Dresses"),
  ];
}
