import 'package:flutter/material.dart';

class Category{
  const Category({required this.id,
  required this.title,
  this.color=Colors.orange//default color
  });
  final String id;//for find spesific category
  final String title;
  final Color color;
}