import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:url_launcher/url_launcher.dart';

class PaginaAjuda extends StatelessWidget {
  const PaginaAjuda({super.key});

  Future<void> _launchUrl(link) async {
    final url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Text(
              'Perguntas Frequentes',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Como posso me cadastrar no aplicativo?'),
              subtitle: Text(
                'Para se cadastrar, clique em "Registrar" na tela inicial e siga as instruções.',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
              ),
            ),
            ListTile(
              title:
                  const Text('Onde posso encontrar as notícias mais recentes?'),
              subtitle: Text(
                'As notícias mais recentes estão disponíveis na seção "Notícias" no menu principal.',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
              ),
            ),
            ListTile(
              title: const Text('Como posso contribuir com iniciativas?'),
              subtitle: Text(
                'Você pode encontrar as iniciativas na seção "Iniciativas" no menu principal.',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Últimas Postagens',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Instagram'),
              subtitle: Text(
                'Veja as últimas postagens do projeto no Instagram',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _launchUrl("https://www.instagram.com/girls_in_ctrl/");
              },
            ),
            ListTile(
              title: const Text('LinkedIn'),
              subtitle: Text(
                'Confira as últimas atualizações do projeto no LinkedIn',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
              ),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                _launchUrl("https://www.linkedin.com/groups/12655726/");
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Contato',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 10),
            ListTile(
              title: const Text('Suporte Técnico'),
              subtitle: Text(
                'Para obter suporte técnico, envie um e-mail marianaalmeidafga@gmail.com',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
              ),
            ),
            ListTile(
              title: const Text('Feedback'),
              subtitle: Text(
                'Envie seu feedback sobre o aplicativo para marianaalmeidafga@gmail.com',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
