import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/cards.trilha.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/paginas/backend.paginas.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/paginas/frontend.paginas.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/paginas/fullstack.paginas.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/paginas/mobile.paginas.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';

class PrincipalTrilha extends StatefulWidget {
  const PrincipalTrilha({super.key});

  @override
  State<PrincipalTrilha> createState() => _PrincipalTrilhaState();
}

class _PrincipalTrilhaState extends State<PrincipalTrilha> {
  List<CardsTrilha> allCards = [];
  List<CardsTrilha> filteredCards = [];

  late BuildContext _context; // Store the context

  void performSearch(String searchText) {
    setState(() {
      filteredCards = allCards
          .where((card) =>
              card.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize your card list here
    allCards = [
      CardsTrilha(
        title: "Trilha FullStack",
        subtitle: "Tudo para se tornar uma desenvolvedora fullstack!",
        color: Color.fromARGB(255, 176, 163, 247),
        icon: Icon(Icons.computer_outlined, color: Colors.white),
        onTap: () {
          Navigator.push(
            _context, // Use the stored context here
            MaterialPageRoute(builder: (context) => PaginaFullStack()),
          );
        },
      ),
      CardsTrilha(
        title: "Trilha BackEnd",
        subtitle: "Tudo para se tornar uma desenvolvedora backend!",
        color: Color.fromARGB(255, 157, 140, 252),
        icon: Icon(Icons.backup_outlined, color: Colors.white),
        onTap: () {
          Navigator.push(
            _context, // Use the stored context here
            MaterialPageRoute(builder: (context) => PaginaBackend()),
          );
        },
      ),
      CardsTrilha(
        title: "Trilha FrontEnd",
        subtitle: "Tudo para se tornar uma desenvolvedora frontend!",
        color: Color(0xff8973ff),
        icon: Icon(Icons.web, color: Colors.white),
        onTap: () {
          Navigator.push(
            _context, // Use the stored context here
            MaterialPageRoute(builder: (context) => PaginaFrontend()),
          );
        },
      ),
      CardsTrilha(
        title: "Trilha Mobile",
        subtitle: "Tudo para se tornar uma desenvolvedora mobile fullstack!",
        color: Color(0xff704fff),
        icon: Icon(Icons.smartphone_outlined, color: Colors.white),
        onTap: () {
          Navigator.push(
            _context, // Use the stored context here
            MaterialPageRoute(builder: (context) => PaginaMobile()),
          );
        },
      ),
      // Add more cards here
    ];

    filteredCards = allCards;
  }

  @override
  Widget build(BuildContext context) {
    // Store the context
    _context = context;

    return Scaffold(
      appBar: myappBar(
        context,
        Colors.transparent,
        "Trilha",
        "Trilha do Conhecimento",
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 20,
          top: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchText(performSearch),
              SizedBox(
                height: 20,
              ),
              ...filteredCards.map((card) => card).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
