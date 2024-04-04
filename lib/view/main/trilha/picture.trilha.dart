import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Picture(String image) {
  return ColorFiltered(
    colorFilter: ColorFilter.mode(
      Colors.black.withOpacity(0.5),
      BlendMode.srcATop,
    ),
    child: Image.asset(
      "$image",
      fit: BoxFit.cover,
      height: 180,
      width: double.infinity,
    ),
  );
}
