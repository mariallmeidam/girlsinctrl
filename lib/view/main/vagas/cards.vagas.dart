import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';
import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/jobs.controllers.dart';
import 'package:tcc_girls_in_ctrl/controllers/news.controllers.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/likenews.models.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/search.widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class CardsJobs extends StatefulWidget {
  const CardsJobs({super.key});

  @override
  State<CardsJobs> createState() => _CardsJobsState();
}

Future<void> _launchUrl(link) async {
  final url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

share(link) {
  SocialShare.shareOptions(
      "Não deixe de conferir essa vaga perfeita para você! Veja no $link");
}

class _CardsJobsState extends State<CardsJobs> {
  List<dynamic> vagas = [];
  List<dynamic> filteredvagas = [];
  bool liked = false;

  void initState() {
    super.initState();
    getVagas().then((data) {
      setState(() {
        vagas = data;
        filteredvagas = vagas;
      });
    });
  }

  void search(value) {
    setState(() {
      filteredvagas = vagas.where((jobsItem) {
        final title = jobsItem['title'] ?? '';
        return title.toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
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
          future: getVagas(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics:
                    NeverScrollableScrollPhysics(), // Desabilita o scroll do ListView
                shrinkWrap: true,
                itemCount: filteredvagas.length,
                itemBuilder: (context, index) {
                  final jobsItem = filteredvagas[index];
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
                              vertical: 20, horizontal: 20),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                jobsItem['date'] ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      fontSize: 10,
                                      color: Colors.black45,
                                    ),
                                maxLines:
                                    3, // Define o número máximo de linhas do texto
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                jobsItem['title'] ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                                maxLines:
                                    3, // Define o número máximo de linhas do texto
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          onTap: () {},
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 4,
                              ),
                              GestureDetector(
                                child: Text(
                                  jobsItem['description'] ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                        fontSize: 14,
                                      ),
                                  maxLines:
                                      1, // Define o número máximo de linhas do texto
                                  overflow: TextOverflow.ellipsis,
                                ),
                                onTap: () {},
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          _launchUrl(jobsItem['link'] ?? '');
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            right: 5,
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: Color(0xff2f1e81),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Aplicar para vaga",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward,
                                                  size: 16,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          share(jobsItem['link']);
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 151, 138, 226),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Compartilhar",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        color: Colors.white,
                                                      ),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                                Icon(
                                                  Icons.share_outlined,
                                                  size: 16,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
