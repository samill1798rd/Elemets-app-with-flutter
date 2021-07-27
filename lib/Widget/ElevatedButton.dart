import 'dart:js';

import 'package:flutter/material.dart';

ElevatedButton CreateElevatedButton(String name, Future<dynamic> callback) {
  return ElevatedButton(
    onPressed: () async {
      await callback;
    },
    child: Text(
      name,
      style: TextStyle(fontSize: 24.00),
    ),
  );
}
