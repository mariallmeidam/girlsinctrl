import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/news.controllers.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/likenews.models.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CardsNoticias extends StatefulWidget {
  const CardsNoticias({super.key});

  @override
  State<CardsNoticias> createState() => _CardsNoticiasState();
}

Future<void> _launchUrl(link) async {
  final url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

share(link) {
  SocialShare.shareOptions(
      "Não deixe de conferir esta notícia imperdível sobre tecnologia! Acesse $link e fique por dentro das últimas novidades do mundo da tecnologia.");
}

class _CardsNoticiasState extends State<CardsNoticias> {
  List<dynamic> noticias = [];
  List<dynamic> filteredNoticias = [];
  bool liked = false;

  void initState() {
    super.initState();
    fetchNoticias().then((data) {
      setState(() {
        noticias = data;
        filteredNoticias = noticias;
      });
    });
  }

  void search(value) {
    setState(() {
      filteredNoticias = noticias.where((newsItem) {
        final title = newsItem['title'] ?? '';
        // Filtrar com base no título ou na descrição da notícia
        return title.toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  void createLikeNews(
      String title, String description, String link, String image) async {
    // Pega valores inseridos e envia para a função register
    ApiResponse response = await like_news(
      title,
      description,
      link,
      image,
    );

    // Salva ou não valores temporários
    if (response.error == null) {
      Like_news like_news = response.data as Like_news;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Notícia favoritada!')));
      print('${like_news.title}');
    } else {
      print('Erro: ${response.error}');
    }
  }

  void _searchLikeNews(
    String name,
    String title,
    String description,
    String link,
    String image,
  ) async {
    ApiResponse response = await searchLikeNews(name);

    if (response.error == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Esta notícia já está favoritada')));
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => OptionScreem()),
                (route) => false)
          });
    } else {
      createLikeNews(title, description, link, image);
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
          future: fetchNoticias(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Desabilita o scroll do ListView
                shrinkWrap: true,
                itemCount: filteredNoticias.length,
                itemBuilder: (context, index) {
                  final newsItem = filteredNoticias[index];
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
                              child: ClipRRect(
                                child: Image.network(
                                  newsItem['image'] ?? '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {
                              _launchUrl(newsItem['link'] ?? '');
                            },
                          ),
                          title: GestureDetector(
                            child: Text(
                              newsItem['title'] ?? '',
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
                              _launchUrl(newsItem['link'] ?? '');
                            },
                          ),
                          subtitle: GestureDetector(
                            child: Text(
                              newsItem['description'] ?? '',
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
                              _launchUrl(newsItem['link'] ?? '');
                            },
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  share(newsItem['link']);
                                },
                                child: const Icon(
                                  Icons.share_outlined,
                                  size: 18,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _searchLikeNews(
                                    newsItem['title'] ?? '',
                                    newsItem['title'] ?? '',
                                    newsItem['description'] ?? '',
                                    newsItem['link'] ?? '',
                                    newsItem['image'] ?? '',
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
