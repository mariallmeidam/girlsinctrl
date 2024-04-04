import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/main/iniciativas/cards.iniciativas.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/image.menu.dart';
import 'package:url_launcher/url_launcher.dart';

class PrincipalIniciativas extends StatefulWidget {
  const PrincipalIniciativas({super.key});

  @override
  State<PrincipalIniciativas> createState() => _PrincipalIniciativasState();
}

Future<void> _launchUrl(link) async {
  final url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class _PrincipalIniciativasState extends State<PrincipalIniciativas> {
  void initState() {
    super.initState();
    ImageApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappBar(
        context,
        Colors.transparent,
        "Iniciativas",
        "Tudo sobre o mundo da tecnologia!",
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: CardsIniciativas(),
        ),
      ),
    );
  }
}
