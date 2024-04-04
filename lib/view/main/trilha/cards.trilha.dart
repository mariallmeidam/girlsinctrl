import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/news.controllers.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/likenews.models.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/paginas/fullstack.paginas.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/botton.widgets.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';
import 'package:url_launcher/url_launcher.dart';

typedef TapCallback = void Function();

class CardsTrilha extends StatefulWidget {
  String title;
  String subtitle;
  Color color;
  Icon icon;
  TapCallback? onTap;

  CardsTrilha({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
    required this.onTap,
  });

  @override
  State<CardsTrilha> createState() => _CardsTrilhaState();
}

class _CardsTrilhaState extends State<CardsTrilha> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              // Ajuste o valor do raio desejado
            ),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              tileColor: Colors.transparent,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(110, 158, 158, 158),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: widget.icon,
              ),
              title: Text(
                widget.title,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              subtitle: Text(
                widget.subtitle,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 12,
                    ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
