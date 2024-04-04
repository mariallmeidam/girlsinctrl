import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget infoHome(context, titulo, subtitulo, Color? color, Widget lista,
    double height, double height2, double height3, String text3, Widget? icon) {
  Future<void> _launchUrl(link) async {
    final url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  return Container(
    color: color,
    height: height2,
    width: double.infinity,
    padding: const EdgeInsets.only(
      left: 32,
    ),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 10,
          ),
          alignment: Alignment.centerLeft,
          height: 50,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titulo,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                subtitulo,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          height: height,
          child: lista,
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            _launchUrl('https://www.instagram.com/girls_in_ctrl/'); //
          },
          child: Container(
            height: height3,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Text(
                  text3,
                  style: const TextStyle(
                      fontSize: 12, decoration: TextDecoration.underline),
                ),
                SizedBox(
                  width: 3,
                ),
                if (icon != null) // Verifica se o ícone é não nulo
                  GestureDetector(
                    onTap: () {
                      _launchUrl('https://www.instagram.com/girls_in_ctrl/'); //
                    },
                    child: icon,
                  ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
