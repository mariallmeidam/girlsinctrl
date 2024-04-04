import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/initiatives.controller.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/likeinitiatives.models.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CardsIniciativas extends StatefulWidget {
  const CardsIniciativas({super.key});

  @override
  State<CardsIniciativas> createState() => _CardsIniciativasState();
}

Future<void> _launchUrl(link) async {
  final url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Não foi possível abrir $url');
  }
}

share(link, name) {
  SocialShare.shareOptions(
      "Não deixe de conferir $name, uma incrível iniciativa que visa incentivar e promover a presença e participação ativa das mulheres no campo da tecnologia! Descubra mais sobre essa iniciativa inspiradora em: $link.");
}

class _CardsIniciativasState extends State<CardsIniciativas> {
  List<dynamic> iniciative = [];
  List<dynamic> filteredInitiative = [];
  bool liked = false;

  void initState() {
    super.initState();
    getInitiatives().then((data) {
      setState(() {
        iniciative = data;
        filteredInitiative = iniciative;
      });
    });
  }

  void search(value) {
    setState(() {
      filteredInitiative = iniciative.where((iniItem) {
        final name = iniItem['name'] ?? '';
        // Filtrar com base no título ou na descrição da notícia
        return name.toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  void createLikeIni(
      String name, String subtitle, String link, String image) async {
    // Pega valores inseridos e envia para a função register
    ApiResponse response = await like_initiatives(
      name,
      subtitle,
      link,
      image,
    );

    // Salva ou não valores temporários
    if (response.error == null) {
      Like_initiatives like_ini = response.data as Like_initiatives;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('$name favoritada!')));
      print('${like_ini.name}');
    } else {
      print('Erro: ${response.error}');
    }
  }

  void _searchLikeIni(
    String name1,
    String name,
    String subtitle,
    String link,
    String image,
  ) async {
    ApiResponse response = await searchLikeIni(name1);

    if (response.error == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Esta iniciativa já está favoritada')));
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => OptionScreem()),
                (route) => false)
          });
    } else {
      createLikeIni(name, subtitle, link, image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchText(search),
        const SizedBox(
          height: 20,
        ),
        FutureBuilder<List<dynamic>>(
          future: getInitiatives(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Desabilita o scroll do ListView
                shrinkWrap: true,
                itemCount: filteredInitiative.length,
                itemBuilder: (context, index) {
                  final iniItem = filteredInitiative[index];
                  return Column(
                    children: [
                      Card(
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          leading: GestureDetector(
                            child: Container(
                              height: 100,
                              width: 80,
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(iniItem['image'] ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              _launchUrl(iniItem['link'] ?? '');
                            },
                          ),
                          title: GestureDetector(
                            child: Text(
                              iniItem['name'] ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                              maxLines:
                                  2, // Define o número máximo de linhas do texto
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              _launchUrl(iniItem['link'] ?? '');
                            },
                          ),
                          subtitle: GestureDetector(
                            child: Text(
                              iniItem['subtitle'] ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontSize: 12,
                                  ),
                              maxLines:
                                  3, // Define o número máximo de linhas do texto
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              _launchUrl(iniItem['link'] ?? '');
                            },
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  share(iniItem['link'], iniItem['name']);
                                },
                                child: const Icon(
                                  Icons.share_outlined,
                                  size: 18,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _searchLikeIni(
                                    iniItem['name'] ?? '',
                                    iniItem['name'] ?? '',
                                    iniItem['subtitle'] ?? '',
                                    iniItem['link'] ?? '',
                                    iniItem['image'] ?? '',
                                  );
                                },
                                child: Icon(
                                  Icons.star_border,
                                  size: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      ],
    );
  }
}
