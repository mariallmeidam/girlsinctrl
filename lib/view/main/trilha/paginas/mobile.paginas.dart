import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/blocos.trilha.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/grafico.trilha.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/picture.trilha.dart';
import 'package:url_launcher/url_launcher.dart';

class PaginaMobile extends StatefulWidget {
  const PaginaMobile({super.key});

  @override
  State<PaginaMobile> createState() => _PaginaMobileState();
}

class _PaginaMobileState extends State<PaginaMobile> {
  Future<void> _launchUrl(link) async {
    final url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black54,
              ),
            ),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        elevation: 0,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Picture("lib/assets/mobile.jpeg"),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 24,
                  bottom: 40,
                ),
                child: Column(
                  children: [
                    Text(
                      "Olá girl! Você já ouviu falar em uma desenvolvedora mobile?  ",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "A utilização de aplicativos em soluções tecnológicas é majoritária no mercado, porém como é feito um “app” e quem os faz? A resposta disso são as desenvolvedoras mobile, que utilizam de linguagens e frameworks para a programação de aplicativos nativos ou híbridos, para IOs e Android. Vamos trilhar nosso caminho mobile? ",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Color.fromARGB(185, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    grafico(
                      context,
                      "R\$\ 3.215, 00",
                      "R\$\ 6.225, 00",
                      "R\$\ 10.963, 00",
                    ),
                    blocos(
                      context,
                      "Lógica de Programação ",
                      "Antes de iniciar o aprendizado de uma linguagem de programação é necessário pensar como um programador, através da lógica de programação! Por meio dela, você irá conseguir explorar qualquer nova linguagem. Até porque, ela é universal! Por meio desse curso você irá aprender mais sobre a lógica de programação através da linguagem Dart, utilizada para a criação de soluções mobile!",
                      'https://baltaio.blob.core.windows.net/static/images/courses/logica-de-programacao-com-dart_banner.jpg',
                      "https://balta.io/cursos/logica-de-programacao-com-dart",
                    ),
                    blocos(
                      context,
                      "Versionamento",
                      "Quando se trabalha em equipe é essencial trabalhar com ferramentas de versionamento de código, podendo organizar o seu trabalho em versões. Esse é um curso rápido para aprender sobre a ferramenta Git e plataformas como GitHub e GitLab: ",
                      'https://img.youtube.com/vi/iQn5vZt0iWI/0.jpg',
                      "https://www.youtube.com/watch?v=iQn5vZt0iWI&list=PLpaKFn4Q4GMOhOuffvi7VagNib0P325AV",
                    ),
                    blocos(
                      context,
                      "Bases do Flutter",
                      "Para se tornar uma grande desenvolvedora mobile é importante aprender sobre ferramentas atuais e utilizadas em grande escala no mercado, e o Flutter é uma delas! Flutter é um framework na linguagem Dart, que possibilita criar aplicativos híbridos, ou seja, tanto para IOs quanto para Android, a partir de um mesmo código. Neste curso você irá aprender sobre as bases do Flutter!  ",
                      'https://i.vimeocdn.com/video/800486830-78ad318eae66d360eafdc48c08cb996d1248797f141ec82881040f1c11b14f20-d?mw=1000&mh=562',
                      "https://balta.io/cursos/criando-seu-primeiro-app-com-flutter",
                    ),
                    blocos(
                      context,
                      "Layouts",
                      "A diagramação e estilo de uma página em um aplicativo são partes muito importantes para o seu sucesso! A partir do curso você irá aprender sobre o essencial para se tornar uma grande desenvolvedora! ",
                      'https://i.vimeocdn.com/video/792452348-a364791217a099005ede2381bc45375d226898bad6578d7269b71b3c6ff1a7e5-d?mw=1000&mh=562',
                      "https://balta.io/cursos/dominando-layouts-no-flutter",
                    ),
                    blocos(
                      context,
                      "Android e IOs",
                      "A diferenciação e criação de um código adaptável aos sistemas operacionais Android e IOs é de muita importância para um desenvolvedor mobile, já que assim, o mesmo código poderá ser utilizado em ambas as situações! Exigindo menor manutenção e tempo do programador! ",
                      'https://i.vimeocdn.com/video/875590860-e3dda7709fc9e30e52ffd3474628f6e642f093ba21fcb5db999ba8294e2623e5-d?mw=1000&mh=562',
                      "https://balta.io/cursos/flutter-layouts-contact-app",
                    ),
                    blocos(
                      context,
                      "Animações",
                      "Para completar sua formação no front end mobile, iremos aprender sobre animações! Ferramentas importantes para criar aplicativos bonitos e dinâmicos!",
                      'https://i.vimeocdn.com/video/838211967-5a25ea6c412f336f9ae62f828f91ac7683848b9a8cf80f199e720aa46804bf6b-d?mw=1000&mh=562',
                      "https://balta.io/cursos/flutter-apps-perfect-eggs",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Banco de Dados",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Iniciando nosso trajeto no backend das nossas aplicações, vamos aprender sobre a base do banco de dados e como utilizá-los de maneira prática nos projetos. Para isso começaremos aprendendo modelagem de dados, essencial para a construção de bancos organizados e funcionais:",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Color.fromARGB(185, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    GestureDetector(
                      child: Image.network(
                        'https://img.youtube.com/vi/SEnnucNP1h0/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=SEnnucNP1h0",
                        );
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Com nossos banco construídos precisamos criar consultas para utilizar dentro das nossas aplicações, e por meio desse curso introdutório de SQL e MySql, podemos realizar nossas consultas ao banco de maneira relacional! ",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Color.fromARGB(185, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    GestureDetector(
                      child: Image.network(
                        'https://img.youtube.com/vi/XQkf-6Yl3WM/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=XQkf-6Yl3WM",
                        );
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Aprendemos a utilizar bancos de dados relacionais, dessa vez vamos aprender sobre banco de dados orientados a  documentos, o MongoDB, no qual armazena dados por meio de documentos flexíveis.",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Color.fromARGB(185, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    GestureDetector(
                      child: Image.network(
                        'https://img.youtube.com/vi/x9tC0eK0GtA/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=x9tC0eK0GtA&t=21s",
                        );
                      },
                    ),
                    blocos(
                      context,
                      "API Rest",
                      "Antes de finalizar nosso aprendizado para a construção de aplicações completas, iremos aprender sobre API, que é nada mais do que um conjunto de regras e protocolos que possibilitam a interação de sistemas e serviços diversos. Através dela iremos conseguir construir projetos completos, porém com o Frontend e Backend separados. Vamos lá?",
                      'https://img.youtube.com/vi/9SbUPqKEWcY/0.jpg',
                      "https://www.youtube.com/watch?v=9SbUPqKEWcY",
                    ),
                    blocos(
                      context,
                      "Backend",
                      "Antes de finalizar nosso aprendizado para a construção de aplicações completas, iremos aprender sobre API, que é nada mais do que um conjunto de regras e protocolos que possibilitam a interação de sistemas e serviços diversos. Através dela iremos conseguir construir projetos completos, porém com o Frontend e Backend separados. Vamos lá?",
                      'https://img.youtube.com/vi/kj1owVJWqSw/0.jpg',
                      "https://www.youtube.com/playlist?list=PLRpTFz5_57csByx34C_98wPn3PAxnUDFr",
                    ),
                    blocos(
                      context,
                      "Full Stack",
                      "Para recapitular tudo o que foi estudado nessa trilhagem vamos relembrar nesse curso tudo sobre frontend e backend em aplicações mobile, criando assim um aplicativos full stack, e nos tornando também desenvolvedoras mobile full stack! Vamos finalizar essa trilhagem? ",
                      'https://img.youtube.com/vi/CowjMR7yU9w/0.jpg',
                      "https://www.youtube.com/playlist?list=PLRpTFz5_57cvJyGFOD-Jx_cYqc1t2Wjk1",
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      color: Colors.black38,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Plus",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Nesse link temos uma trilha completa sobre os principais tópicos necessários para ser um desenvolvedor backend excepcional! Chegou a hora de explorar!",
                      textAlign: TextAlign.justify,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Color.fromARGB(185, 0, 0, 0),
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          // Ajuste o valor do raio desejado
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          tileColor: Color.fromARGB(209, 66, 55, 151),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          title: GestureDetector(
                            child: Text(
                              "Trilha Completa Mobile",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                            ),
                            onTap: () {},
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
                      onTap: () {
                        _launchUrl("https://techguide.sh/pt-BR/path/flutter/");
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
