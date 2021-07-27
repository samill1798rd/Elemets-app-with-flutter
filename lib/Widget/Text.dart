import 'package:flutter/material.dart';

Text CreateText(String content, Color color) {
  return Text(
    content,
    style: TextStyle(
      color: color,
      fontSize: 18,
    ),
  );
}
