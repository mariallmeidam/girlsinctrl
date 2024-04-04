import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/news.controllers.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/likenews.models.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:url_launcher/url_launcher.dart';

class ListNewsProfile extends StatefulWidget {
  const ListNewsProfile({super.key});

  @override
  State<ListNewsProfile> createState() => _ListNewsProfileState();
}

class _ListNewsProfileState extends State<ListNewsProfile> {
  List<dynamic> _likesList = [];
  bool loading = true;

  @override
  void initState() {
    _getNews();
    super.initState();
  }

  // Get likes
  Future<void> _getNews() async {
    ApiResponse response = await getLikeNews();

    if (response.error == null) {
      List<dynamic> likesData = response.data as List<dynamic>;

      setState(() {
        _likesList = likesData.reversed.toList();
        loading = loading ? !loading : loading;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => OptionScreem()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Delete Like News
  void _deteleLikeNews(int newsId) async {
    ApiResponse response = await deleteLikeNews(newsId);

    if (response.error == null) {
      setState(() {
        _getNews();
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Notícia deletada dos favoritos.')));
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => OptionScreem()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Abrir link em novo local
  Future<void> _launchUrl(link) async {
    final url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  // Compartilhar
  share(link) {
    SocialShare.shareOptions(
        "Não deixe de conferir esta notícia imperdível sobre tecnologia! Acesse $link e fique por dentro das últimas novidades do mundo da tecnologia.");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          await _getNews();
        },
        child: ListView.builder(
          itemCount: _likesList.length,
          itemBuilder: (BuildContext context, int index) {
            Like_news likeNews = _likesList[index];
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      // Ajuste o valor do raio desejado
                    ), // Deixando o fundo do card transparente
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: Colors.transparent,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      leading: GestureDetector(
                        child: Container(
                          height: 60,
                          width: 60,
                          child: ClipRRect(
                            child: Image.network(
                              likeNews.image ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () {
                          _launchUrl(likeNews.link ?? '');
                        },
                      ),
                      title: GestureDetector(
                        child: Text(
                          likeNews.title ?? '',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                          maxLines:
                              2, // Define o número máximo de linhas do texto
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          _launchUrl(likeNews.link ?? '');
                        },
                      ),
                      subtitle: GestureDetector(
                        child: Text(
                          likeNews.description ?? '',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontSize: 12,
                                  ),
                          maxLines:
                              2, // Define o número máximo de linhas do texto
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          _launchUrl(likeNews.link ?? '');
                        },
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              share(likeNews.link);
                            },
                            child: const Icon(
                              Icons.share_outlined,
                              size: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _deteleLikeNews(
                                likeNews.id!,
                              );
                            },
                            child: Icon(
                              Icons.delete_outline_outlined,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
