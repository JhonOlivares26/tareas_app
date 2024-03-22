import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.blueAccent,
  );
}