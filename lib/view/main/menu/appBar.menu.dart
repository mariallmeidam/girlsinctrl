import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/image.menu.dart';
import 'package:tcc_girls_in_ctrl/view/main/profile/principal.profile.dart';

AppBar myappBar(
  BuildContext context,
  Color color,
  String? title,
  String? subtitle,
) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 80,
    backgroundColor: color,
    title: Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: Theme.of(context).textTheme.headline2?.copyWith(
                        color: Colors.black,
                      ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  subtitle ?? '',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(
          right: 15,
          top: 20,
          bottom: 20,
        ),
        child: ImageApp(),
      ),
    ],
  );
}
