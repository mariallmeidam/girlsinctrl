import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/blocos.trilha.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/grafico.trilha.dart';
import 'package:tcc_girls_in_ctrl/view/main/trilha/picture.trilha.dart';
import 'package:url_launcher/url_launcher.dart';

class PaginaFrontend extends StatefulWidget {
  const PaginaFrontend({super.key});

  @override
  State<PaginaFrontend> createState() => _PaginaFrontendState();
}

class _PaginaFrontendState extends State<PaginaFrontend> {
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
              Picture("lib/assets/frontend.jpg"),
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
                      "Olá girl! Você já ouviu falar em uma desenvolvedora front end? ",
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
                      "Uma desenvolvedora front-end é uma profissional responsável por criar aplicações bonitas e interativas com o usuário, tendo conhecimentos como HTML, CSS, e Javascript. A trilha de uma desenvolvedora front-end é muito emocionante e principalmente criativa, e trará muitos benefícios para sua vida profissional! Vamos aprender mais sobre essa área?",
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
                      "R\$\ 3.000, 00",
                      "R\$\ 5.972, 00",
                      "R\$\ 10.095, 00",
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
                      "API Rest",
                      "Antes de finalizar nosso aprendizado para a construção de sistemas completos, ou full : ), iremos aprender sobre API, que é nada mais do que um conjunto de regras e protocolos que possibilitam a interação de sistemas e serviços diversos. Através dela iremos conseguir construir projetos completos, porém com o Frontend e Backend separados. Vamos lá?",
                      'https://img.youtube.com/vi/9SbUPqKEWcY/0.jpg',
                      "https://www.youtube.com/watch?v=9SbUPqKEWcY",
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
                        "Metodologia CSS",
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
                      "Quando se fala em uma ótima desenvolvedora front end, logo podemos pensar nas suas habilidades de organizações dentro de um CSS escalável e de fácil utilização.Para a construção de um ótimo código front utilizamos metodologias CSS, importantes para se tornar uma desenvolvedora com skills diferentes do mercado e que consiga se adaptar às necessidades de cada ambiente de trabalho. Nessa trilha iremos aprender sobre as três principais metodologias, o BEM CSS, OOCSS e SMACSS! ",
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
                        'https://img.youtube.com/vi/rltjnLyjFZk/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=rltjnLyjFZk",
                        );
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    GestureDetector(
                      child: Image.network(
                        'https://img.youtube.com/vi/LOGsjV2y_4U/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=LOGsjV2y_4U",
                        );
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    GestureDetector(
                      child: Image.network(
                        'https://img.youtube.com/vi/aPycJaf4ERg/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=aPycJaf4ERg",
                        );
                      },
                    ),
                    blocos(
                      context,
                      "Bootstrap ",
                      "Conhecer a base do desenvolvimento frontend web é a parte principal para se utilizar de maneira sábia bons frameworks! O bootstrap surge como um ferramenta para se escrever o CSS inline nas suas aplicações, sendo uma das mais utilizadas do mercado!",
                      'https://img.youtube.com/vi/jJUpJA1GJHw/0.jpg',
                      "https://www.youtube.com/watch?v=jJUpJA1GJHw&t=1190s",
                    ),
                    blocos(
                      context,
                      "Tailwinds CSS",
                      "O Tailwinds CSS nasce com o intuito de ser um facilitador das escritas css, porém diferentemente do Bootstrap, possui a característica de ser mais adaptável a mudanças e estilizações. Ele possui uma gama de ferramentas que possibilitam um desenvolvedor a criar aplicações amigáveis ao usuário e responsivas. Vamos nessa?",
                      'https://img.youtube.com/vi/1eLaBow7Zbo/0.jpg',
                      "https://www.youtube.com/playlist?list=PLcoYAcR89n-r1m-tMfV4qndrRWpT_rb9u",
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
                        "Frameworks e Bibliotecas JS",
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
                      "Para finalizar nossa trilha para ser uma incrível desenvolvedora front-end, não poderíamos deixar de lado os frameworks e bibliotecas JS, amplamente utilizados nas soluções de aplicações web. Nota-se que, atualmente, novos frameworks e bibliotecas surgem no mercado todos os dias e isso pode deixar as desenvolvedoras com uma dúvida constante: ‘Por qual deveria começar?’. Infelizmente, não há uma resposta exata para essa pergunta, visto que tudo depende da necessidade do seu projeto. Porém uma dica, é aprender os mais utilizados do mercado, e se manter atenta às novas ferramentas que poderão surgir, migrando caso necessário de tecnologia. Assim, quando se aprende muito bem um framework ou biblioteca, as adaptações para os próximos serão fáceis, e o seu caminho como uma dev front será com certeza excepcional! ",
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
                        'https://img.youtube.com/vi/8-3ZOdp_ZDo/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=8-3ZOdp_ZDo",
                        );
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    GestureDetector(
                      child: Image.network(
                        'https://img.youtube.com/vi/FXqX7oof0I4/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/playlist?list=PLnDvRpP8BneyVA0SZ2okm-QBojomniQVO",
                        );
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    GestureDetector(
                      child: Image.network(
                        'https://img.youtube.com/vi/vJt_K1bFUeA/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=vJt_K1bFUeA&list=PLnDvRpP8Bnex2GQEN0768_AxZg_RaIGmw",
                        );
                      },
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    GestureDetector(
                      child: Image.network(
                        'https://img.youtube.com/vi/wsAQQioPIJs/0.jpg',
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                      onTap: () {
                        _launchUrl(
                          "https://www.youtube.com/watch?v=wsAQQioPIJs&list=PLnDvRpP8BnezDglaAvtWgQXzsOmXUuRHL",
                        );
                      },
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
                      "Nesse link temos uma trilha completa sobre os principais tópicos necessários para ser um desenvolvedor frontend excepcional! Chegou a hora de explorar!!",
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
                              "Trilha Completa Frontend",
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
                            "https://techguide.sh/pt-BR/path/front-end/");
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
                              "Trilha Completa React",
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
                        _launchUrl("https://techguide.sh/pt-BR/path/react/");
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
                              "Trilha Completa Angular",
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
                        _launchUrl("https://techguide.sh/pt-BR/path/angular/");
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
                              "Trilha Completa Vue",
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
                        _launchUrl("https://techguide.sh/pt-BR/path/vue/");
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
