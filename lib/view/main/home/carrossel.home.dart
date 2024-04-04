import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Carrossel(String image) {
  return Image.asset(
    "$image",
    fit: BoxFit.cover,
    height: 180,
    width: double.infinity,
  );
}
