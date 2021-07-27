import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Text.dart';

InkWell CreateInkWell(String content, Color color, String link) {
  return InkWell(
    child: CreateText(content, color),
    onTap: () => launch(link),
  );
}
