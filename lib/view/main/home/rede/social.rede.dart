import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> _launchUrl(link) async {
  final url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Widget rede(context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(
          right: 20,
          bottom: 10,
        ),
        child: GestureDetector(
          onTap: () {
            _launchUrl("https://www.instagram.com/girls_in_ctrl/");
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              // Ajuste o valor do raio desejado
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              tileColor: Color.fromARGB(255, 151, 138, 226),
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              leading: Container(
                height: 50,
                width: 30,
                color: Colors.transparent,
                child: Icon(
                  FontAwesomeIcons.instagram,
                  size: 24,
                  color: Colors.white70,
                ),
              ),
              title: Text(
                "Instagram",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 14,
                    ),
              ),
              subtitle: Text(
                "Curiosidades e informações sobre a TI!",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 10,
                      color: Colors.white70,
                    ),
              ),
              trailing: Container(
                height: 30,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          right: 20,
          bottom: 24,
        ),
        child: GestureDetector(
          onTap: () {
            _launchUrl("https://www.linkedin.com/groups/12655726/");
          },
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              // Ajuste o valor do raio desejado
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              tileColor: Color.fromARGB(255, 182, 172, 241),
              contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              leading: Container(
                height: 50,
                width: 30,
                color: Colors.transparent,
                child: Icon(
                  FontAwesomeIcons.linkedin,
                  size: 24,
                  color: Colors.white70,
                ),
              ),
              title: Text(
                "Linkedin",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 14,
                    ),
              ),
              subtitle: Text(
                "Tenha contato com um grupo de apoio incrível!",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 10,
                      color: Colors.white70,
                    ),
              ),
              trailing: Container(
                height: 30,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
