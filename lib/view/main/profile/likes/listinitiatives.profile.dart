import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/initiatives.controller.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/likeinitiatives.models.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:url_launcher/url_launcher.dart';

class ListinitiativesProfile extends StatefulWidget {
  const ListinitiativesProfile({Key? key}) : super(key: key);

  @override
  State<ListinitiativesProfile> createState() => _ListinitiativesProfileState();
}

class _ListinitiativesProfileState extends State<ListinitiativesProfile> {
  List<dynamic> _likesList = [];
  bool loading = true;

  @override
  void initState() {
    _getInitiatives();
    super.initState();
  }

  // Get likes
  Future<void> _getInitiatives() async {
    ApiResponse response = await getLikeInitiatives();

    if (response.error == null) {
      setState(() {
        _likesList = response.data as List<dynamic>;
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

  // Delete Like Initiatives
  void _deleteLikeIni(int iniId, String likeName) async {
    ApiResponse response = await deleteLikeIni(iniId);

    if (response.error == null) {
      setState(() {
        _getInitiatives();
      });
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$likeName deletada dos favoritos.')));
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

  Future<void> _launchUrl(link) async {
    final url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  share(link, name) {
    SocialShare.shareOptions(
        "Não deixe de conferir $name, uma incrível iniciativa que visa incentivar e promover a presença e participação ativa das mulheres no campo da tecnologia! Descubra mais sobre essa iniciativa inspiradora em: $link.");
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          await _getInitiatives();
        },
        child: ListView.builder(
          itemCount: _likesList.length,
          itemBuilder: (BuildContext context, int index) {
            Like_initiatives likeInitiatives = _likesList[index];
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 4,
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(likeInitiatives.image ?? ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () {
                          _launchUrl(likeInitiatives.link ?? '');
                        },
                      ),
                      title: GestureDetector(
                        child: Text(
                          likeInitiatives.name ?? '',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                          maxLines:
                              2, // Define o número máximo de linhas do texto
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          _launchUrl(likeInitiatives.link ?? '');
                        },
                      ),
                      subtitle: GestureDetector(
                        child: Text(
                          likeInitiatives.subtitle ?? '',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontSize: 12,
                                  ),
                          maxLines:
                              3, // Define o número máximo de linhas do texto
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          _launchUrl(likeInitiatives.link ?? '');
                        },
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              share(likeInitiatives.link, likeInitiatives.name);
                            },
                            child: const Icon(
                              Icons.share_outlined,
                              size: 18,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _deleteLikeIni(
                                  likeInitiatives.id!, likeInitiatives.name!);
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
