import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl(link) async {
  final url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Widget blocos(
  context,
  String title,
  String description,
  String image,
  String link,
) {
  return Column(
    children: [
      SizedBox(
        height: 20,
      ),
      const Divider(
        color: Colors.black38,
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 16,
              ),
        ),
      ),
      SizedBox(
        height: 36,
      ),
      Text(
        description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: Color.fromARGB(185, 0, 0, 0),
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
      ),
      SizedBox(
        height: 36,
      ),
      GestureDetector(
        child: Image.network(
          image,
          fit: BoxFit.cover,
          height: 180,
          width: double.infinity,
        ),
        onTap: () {
          _launchUrl(
            link,
          );
        },
      ),
    ],
  );
}
