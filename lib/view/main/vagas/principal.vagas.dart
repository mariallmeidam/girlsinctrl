import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/main/vagas/cards.vagas.dart';

class PrincipalVagas extends StatefulWidget {
  const PrincipalVagas({super.key});

  @override
  State<PrincipalVagas> createState() => _PrincipalVagasState();
}

class _PrincipalVagasState extends State<PrincipalVagas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myappBar(
        context,
        Colors.transparent,
        "Vagas",
        "Veja vagas no mercado de TI!",
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            CardsJobs(),
          ]),
        ),
      ),
    );
  }
}
