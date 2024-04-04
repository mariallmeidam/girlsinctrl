import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/blocos.trilha.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/grafico.trilha.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/picture.trilha.dart';
import 'package:url_launcher/url_launcher.dart';

class PaginaBackend extends StatefulWidget {
  const PaginaBackend({super.key});

  @override
  State<PaginaBackend> createState() => _PaginaBackendState();
}

class _PaginaBackendState extends State<PaginaBackend> {
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
              Picture("lib/assets/backend.jpg"),
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
                      "Olá girl! Você sabe o que é uma desenvolvedora backend? ",
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
                      "Uma desenvolvedora backend cuida de tudo o que acontece nos bastidores de uma aplicação ou site, ou seja, são responsáveis por garantir que todos os dados de um site sejam armazenados e recuperados corretamente. Assim, elas criam todas as regras de negócio necessárias, fazendo-as de maneira eficiente e com segurança. A trilha de uma desenvolvedora backend é muito desafiadora, porém trará muitos benefícios para a sua vida profissional. Vamos trilhar esse caminho?",
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
                      "R\$\ 3.355, 00",
                      "R\$\ 6.424, 00",
                      "R\$\ 10.483 , 00",
                    ),
                    blocos(
                      context,
                      "Bases da Internet: ",
                      "Antes de se tornar uma ótima desenvolvedora backend é preciso aprender as principais bases da tecnologia, e por meio desse curso você irá aprender o essencial sobre a internet, como fundamentos de redes de computadores e internet:",
                      'https://img.youtube.com/vi/YbRHeRFYyCQ/0.jpg',
                      "https://www.youtube.com/playlist?list=PLAp37wMSBouDdpuuYhZfEK9oH0qk0IANb",
                    ),
                    blocos(
                      context,
                      "HTML e CSS",
                      "Continuando nosso aprendizado para uma carreira de sucesso, iremos aprender sobre as duas principais linguagens do desenvolvimento web. Sendo o HTML, uma linguagem de marcação para construção do esqueleto das páginas, e o CSS, o estilo necessário para dar um visual interessante para os sites. Vamos lá? Esse é um curso introdutório das duas linguagens!",
                      'https://img.youtube.com/vi/PuyZAUyZYDI/0.jpg',
                      "https://www.youtube.com/watch?v=PuyZAUyZYDI",
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
                      "Agora sim iremos explorar uma linguagem de programação. O javascript é a principal linguagem para desenvolvedores webs tornarem suas aplicações dinâmicas, e por meio do aprendizado dessa linguagem você conseguirá ter uma visão completa do funcionamento de uma aplicação, construindo um backend bem formulado e interativo com as necessidades do frontend! ",
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
                      "Para completar nosso aprendizado para a construção de sistemas backend, iremos aprender sobre API, que é nada mais do que um conjunto de regras e protocolos que possibilitam a interação de sistemas e serviços diversos. Através dela iremos conseguir construir projetos completos, porém com o Frontend e Backend separados. Os desenvolvedores back end utilizam muito de API, já que são os responsáveis por criá-las e oferecer para o frontend! ",
                      'https://img.youtube.com/vi/9SbUPqKEWcY/0.jpg',
                      "https://www.youtube.com/watch?v=9SbUPqKEWcY",
                    ),
                    blocos(
                      context,
                      "Node JS",
                      "Chegou o momento de aprender sobre frameworks, que são um conjunto de ferramentas e bibliotecas que possibilitam um desenvolvimento ágil e rápido aos desenvolvedores. Assim, iremos iniciar o aprendizado do Node Js que utiliza o Javascript fora do navegador interagindo com os banco de dados. Vamos nessa?",
                      'https://img.youtube.com/vi/IOfDoyP1Aq0/0.jpg',
                      "https://www.youtube.com/watch?v=IOfDoyP1Aq0",
                    ),
                    blocos(
                      context,
                      "PHP",
                      "Um bom desenvolvedor backend sabe muito bem uma linguagem e framework, porém nunca fica refém a ela! Por isso, nessa trilhagem de backend vamos aprender sobre o PHP, uma das principais linguagens para o desenvolvimento web no lado do servidor. Neste curso, você irá aprender sobre tudo o que é essencial para dominar essa linguagem.",
                      'https://img.youtube.com/vi/TfsO0BGvGn0/0.jpg',
                      "https://www.youtube.com/watch?v=TfsO0BGvGn0&list=PLHz_AreHm4dlFPrCXCmd5g92860x_Pbr_",
                    ),
                    blocos(
                      context,
                      "Laravel",
                      "Os frameworks buscam dar agilidade à vida de um desenvolvedor, assim o Laravel surge como uma ferramenta para os desenvolvedores backend. Disponibilizando recursos e organizações favoráveis para um sistema do lado do servidor excepcional! ",
                      'https://img.youtube.com/vi/qH7rsZBENJo/0.jpg',
                      "https://www.youtube.com/watch?v=qH7rsZBENJo&list=PLnDvRpP8BnewYKI1n2chQrrR4EYiJKbUG",
                    ),
                    blocos(
                      context,
                      "Segurança da Informação",
                      "Finalizando nosso trajeto para ser uma ótima desenvolvedora backend, necessitamos compreender sobre segurança da informação, e como isso implica em formulações adequadas e seguras de sistemas e sites. Chegou a hora de terminarmos essa etapa! ",
                      'https://img.youtube.com/vi/KvPtIl-Gz2E/0.jpg',
                      "https://www.youtube.com/watch?v=KvPtIl-Gz2E&list=PLHz_AreHm4dlaTyjolzCFC6IjLzO8O0XV",
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
                              "Trilha Completa Node JS",
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
                        _launchUrl("https://techguide.sh/pt-BR/path/nodejs/");
                      },
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
                              "Trilha Completa PHP",
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
                        _launchUrl("https://techguide.sh/pt-BR/path/php/");
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
