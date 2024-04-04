import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/controllers/social.controllers.dart';
import 'package:url_launcher/url_launcher.dart';

class CardsInstagram extends StatefulWidget {
  const CardsInstagram({super.key});

  @override
  State<CardsInstagram> createState() => _CardsInstagramState();
}

class _CardsInstagramState extends State<CardsInstagram> {
  List<dynamic> posts = [];

  void initState() {
    super.initState();
    getInstagram().then((data) {
      setState(() {
        posts = data;
      });
    });
  }

  Future<void> _launchUrl(link) async {
    final url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: getInstagram(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final postItem = posts[index];
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        // Ajuste o valor do raio desejado
                      ),
                      elevation: 2,
                      child: GestureDetector(
                        onTap: () {
                          _launchUrl(postItem['permalink'] ?? ''); //
                        },
                        child: Container(
                          height: 130,
                          width: 140,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              postItem['media_url'] ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
    );
  }
}
