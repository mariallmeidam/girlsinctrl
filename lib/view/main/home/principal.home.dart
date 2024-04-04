import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/carrossel.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/info.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/noticias/cards.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/rede/social.rede.dart';
import 'package:tcc_girls_in_ctrl/view/main/iniciativas/principal.iniciativas.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/image.menu.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/principal.trilha.dart';
import 'package:tcc_girls_in_ctrl/view/main/vagas/principal.vagas.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color.fromRGBO(253, 253, 253, 1),
        title: Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 20,
                  child: Opacity(
                    opacity:
                        0.6, // Defina o valor da opacidade entre 0.0 (totalmente transparente) e 1.0 (totalmente opaco)
                    child: Image.asset('lib/assets/logoPreta.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 15,
              top: 8,
              bottom: 8,
            ),
            child: ImageApp(),
          ),
          // Adicione o ImageApp como uma ação à direita do AppBar
        ],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Carrossel("lib/assets/banner.jpg"),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 24,
                  top: 24,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrincipalTrilha(),
                      ),
                    );
                  },
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
                      tileColor: Color(0xff2f1e81),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      leading: Container(
                        height: 60,
                        width: 60,
                        color: Colors.transparent,
                        child: Icon(
                          Icons.hiking_rounded,
                          size: 36,
                          color: Colors.white60,
                        ),
                      ),
                      title: Text(
                        "Trilhas",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                      ),
                      subtitle: Text(
                        "Sua base de conhecimento!",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontSize: 12,
                              color: Colors.white54,
                            ),
                      ),
                      trailing: Container(
                        height: 40,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 24,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, // Use the stored context here
                            MaterialPageRoute(
                                builder: (context) => PrincipalVagas()),
                          );
                        },
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            // Ajuste o valor do raio desejado
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            tileColor: Color.fromARGB(12, 0, 0, 0),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 20),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  color: Colors.transparent,
                                  child: Icon(
                                    Icons.work_outline,
                                    size: 24,
                                    color: Color.fromARGB(120, 0, 0, 0),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        8), // Espaçamento entre o ícone e o texto
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Vagas",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(140, 0, 0, 0),
                                            fontSize: 16,
                                          ),
                                    ),
                                    Text(
                                      "Veja vagas na TI!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(140, 0, 0, 0),
                                            fontSize: 10,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, // Use the stored context here
                            MaterialPageRoute(
                                builder: (context) => PrincipalIniciativas()),
                          );
                        },
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            // Ajuste o valor do raio desejado
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            tileColor: Color.fromARGB(12, 0, 0, 0),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 20),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  color: Colors.transparent,
                                  child: Icon(
                                    Icons.lightbulb_outline,
                                    size: 24,
                                    color: Color.fromARGB(120, 0, 0, 0),
                                  ),
                                ),
                                SizedBox(
                                    width:
                                        8), // Espaçamento entre o ícone e o texto
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Iniciativas",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(140, 0, 0, 0),
                                            fontSize: 16,
                                          ),
                                    ),
                                    Text(
                                      "As principais!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Color.fromARGB(140, 0, 0, 0),
                                            fontSize: 10,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              infoHome(
                context,
                "Notícias",
                "As principais notícias sobre tecnologia!",
                Color.fromARGB(5, 0, 0, 0),
                CardsNewsHome(),
                170,
                260,
                0,
                "",
                null,
              ),
              infoHome(
                context,
                "Redes Sociais",
                "Veja nossa rede de apoio!",
                null,
                rede(context),
                210,
                300,
                0,
                "",
                null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
