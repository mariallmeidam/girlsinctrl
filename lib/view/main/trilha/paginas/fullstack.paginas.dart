import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/blocos.trilha.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/grafico.trilha.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/picture.trilha.dart';
import 'package:url_launcher/url_launcher.dart';

class PaginaFullStack extends StatefulWidget {
  const PaginaFullStack({super.key});

  @override
  State<PaginaFullStack> createState() => _PaginaFullStackState();
}

class _PaginaFullStackState extends State<PaginaFullStack> {
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
              Picture("lib/assets/fullstack.jpg"),
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
                      "Olá girl! Você já ouviu falar em uma desenvolvedora full stack?",
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
                      "Uma desenvolvedora full stack é uma profissional que trabalha em todas as etapas de produção de um sistema ou site, tanto no frontend quanto no backend. Aprender a ser uma desenvolvedora full stack é emocionante e desafiador, e trará grandes resultados para sua vida profissional. Trouxemos para você uma trilha completa para se tornar uma desenvolvedora de sucesso!",
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
                      "R\$\ 3.064, 00",
                      "R\$\ 5.760, 00",
                      "R\$\ 10.000, 00",
                    ),
                    blocos(
                      context,
                      "Bases da Internet: ",
                      "Antes de se tornar uma ótima desenvolvedora full stack é preciso aprender as principais bases da tecnologia, e por meio desse curso você irá aprender o essencial sobre a internet, como fundamentos de redes de computadores e internet:",
                      'https://img.youtube.com/vi/YbRHeRFYyCQ/0.jpg',
                      "https://www.youtube.com/playlist?list=PLAp37wMSBouDdpuuYhZfEK9oH0qk0IANb",
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
                        "HTML e CSS",
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
                      "Continuando nosso aprendizado para uma carreira de sucesso, iremos aprender sobre as duas principais linguagens do desenvolvimento web. Sendo o HTML, uma linguagem de marcação para construção do esqueleto das páginas, e o CSS, o estilo necessário para dar um visual interessante para os sites. Vamos lá? Esse é um curso introdutório das duas linguagens! ",
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
                        'https://img.youtube.com/vi/PuyZAUyZYDI/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=PuyZAUyZYDI",
                        );
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Fundamentar nossas bases no HTML é o principal diferencial em um desenvolvedor. Conhecer e explorar bem o HTML Semântico, facilita para construção de um desenvolvimento ágil! Vamos nessa?",
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
                        'https://img.youtube.com/vi/tAFRHcEH-Pc/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=tAFRHcEH-Pc",
                        );
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      "Programar pensando no mobile é sempre essencial para qualquer desenvolvedor, e para isso precisamos conhecer bem nossa ferramenta de estilização, o CSS. E por meio do Flex Box e Grid, iremos conseguir fazer aplicações incríveis! ",
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
                        'https://img.youtube.com/vi/P9TrFDNwor4/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=P9TrFDNwor4&t=21s",
                        );
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    GestureDetector(
                      child: Image.network(
                        'https://img.youtube.com/vi/8VapN6x897U/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=8VapN6x897U",
                        );
                      },
                    ),
                    blocos(
                      context,
                      "Lógica de Programação",
                      "Antes de iniciar o aprendizado de uma linguagem de programação é necessário pensar como um programador, através da lógica de programação! Por meio dela, você irá conseguir explorar qualquer nova linguagem. Até porque, ela é universal! ",
                      "https://img-c.udemycdn.com/course/240x135/4278258_d5da_2.jpg",
                      "https://www.udemy.com/share/105att3@zWEtvp76ydc2nlSDKFSkBij4oGDwq-wLUBo906yN6Bl0RO51W1i-CXSD0KRmVdTLhw==/",
                    ),
                    blocos(
                      context,
                      "Javascript",
                      "Agora sim iremos explorar uma linguagem de programação. O javascript é a principal linguagem para desenvolvedores webs tornarem suas aplicações dinâmicas, e por meio do aprendizado dessa linguagem você irá conseguir dar vida aos seus sites! ",
                      'https://img.youtube.com/vi/TkD0QMyBa28/0.jpg',
                      "https://www.youtube.com/playlist?list=PLnDvRpP8BneysKU8KivhnrVaKpILD3gZ6",
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
                      "React JS",
                      "Com a nossa base formada no desenvolvimento web, podemos iniciar o aprendizado de frameworks que são um conjunto de ferramentas para facilitar a vida de uma desenvolvedora. Nesse curso, iremos aprender sobre o framework React, o principal no mercado quando se refere ao desenvolvimento de aplicações para o FrontEnd:",
                      'https://img.youtube.com/vi/FXqX7oof0I4/0.jpg',
                      "https://www.youtube.com/playlist?list=PLnDvRpP8BneyVA0SZ2okm-QBojomniQVO",
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
                      "Antes de finalizar nosso aprendizado para a construção de sistemas completos, ou full : ), iremos aprender sobre API, que é nada mais do que um conjunto de regras e protocolos que possibilitam a interação de sistemas e serviços diversos. Através dela iremos conseguir construir projetos completos, porém com o Frontend e Backend separados. Vamos lá?",
                      'https://img.youtube.com/vi/9SbUPqKEWcY/0.jpg',
                      "https://www.youtube.com/watch?v=9SbUPqKEWcY",
                    ),
                    blocos(
                      context,
                      "Node JS",
                      "Finalizando nossa trilha iremos aprender sobre o desenvolvimento backend a partir do framework Node Js. Por meio dele utilizaremos o Javascript fora do navegador, podendo utilizar aquilo que foi aprendido nos cursos de Javascript e React. Vamos finalizar essa trilha?",
                      'https://img.youtube.com/vi/IOfDoyP1Aq0/0.jpg',
                      "https://www.youtube.com/watch?v=IOfDoyP1Aq0",
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
                      "Nesse link temos uma trilha completa sobre os principais tópicos necessários para ser um desenvolvedor full stack excepcional! Chegou a hora de explorar!",
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
                              "Trilha Completa FullStack",
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
                        _launchUrl(
                            "https://techguide.sh/pt-BR/path/full-stack/");
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
