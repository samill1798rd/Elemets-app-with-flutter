import 'package:flutter/material.dart';

BoxDecoration CreateBoxDecoration(String name) {
  return BoxDecoration(
      image: DecorationImage(
          image: AssetImage(name),
          fit: BoxFit.cover));
}
