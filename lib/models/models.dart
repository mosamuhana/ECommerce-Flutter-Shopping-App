import 'package:flutter/material.dart';

class Product {
  final int id;
  final String image, title, description;
  final int size;
  final double price;
  final Color color;
  final List<int> colors;

  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
    this.colors,
  });
}

class Category {
  final int id;
  final String title;

  Category({
    this.id,
    this.title,
  });
}
