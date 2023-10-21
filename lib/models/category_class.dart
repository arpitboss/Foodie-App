import 'package:flutter/material.dart';

class Categorys {
  const Categorys(
      {required this.id, required this.title, this.color = Colors.pink});

  final String id;
  final String title;
  final Color color;
}
