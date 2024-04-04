import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/models/user.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/appBar.menu.dart';
import 'package:tcc_girls_in_ctrl/view/main/profile/ajuda.profile.dart';
import 'package:tcc_girls_in_ctrl/view/main/profile/likes/listnews.profile.dart';
import 'package:tcc_girls_in_ctrl/view/main/profile/likes/listinitiatives.profile.dart';
import 'package:tcc_girls_in_ctrl/view/main/profile/likes/listnews.profile.dart';
import 'package:tcc_girls_in_ctrl/view/main/profile/update.profile.dart';

class PrincipalProfile extends StatefulWidget {
  const PrincipalProfile({super.key});

  @override
  State<PrincipalProfile> createState() => _PrincipalProfileState();
}

class _PrincipalProfileState extends State<PrincipalProfile> {
  // Pega informações sobre o usuário
  User? user;
  bool loading = true;
  File? _imageFile;
  late String txtNameController;
  late String txtLastNameController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String conteudo = '';

  // Pega informações do usuário
  void getUser() async {
    // Obtem dados do usuário
    ApiResponse response = await getUserDetail();
    // Isso obtem uma resposta que será verificada
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;
        txtNameController = user!.name ?? '';
        txtLastNameController = user!.lastname ?? '';

        // Atualiza as informações de acordo com o que foi recolhido
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const OptionScreem()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void initState() {
    super.initState();
    getUser();
  }

  ajuda() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaginaAjuda()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 40,
        elevation: 0,
        title: SizedBox
            .shrink(), // Isso removerá qualquer título ou espaço reservado
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 24,
                color: Colors.black45,
              ),
              onPressed: () {
                ajuda();
              },
            ),
          ),
        ],
      ),
      body: loading
          ? Center(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(
                top: 5,
                left: 20,
                right: 20,
              ),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: _imageFile == null
                                ? user!.image != null
                                    ? DecorationImage(
                                        image: NetworkImage('${user!.image}'),
                                        fit: BoxFit.cover)
                                    : null
                                : DecorationImage(
                                    image: FileImage(_imageFile ?? File('')),
                                    fit: BoxFit.cover,
                                  ),
                            color: Colors.black12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              txtNameController,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              txtLastNameController,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EditProfile()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2),
                          ),
                          child: Text(
                            "Editar Perfil",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w400,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.star_border,
                          size: 20,
                        ),
                      ),
                      Text(
                        "Seus conteúdos favoritados!",
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              fontSize: 18,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              conteudo = 'Notícias';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                conteudo == 'Notícias' || conteudo == ''
                                    ? Colors.black
                                    : Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Notícias',
                            style: TextStyle(
                              color: conteudo == 'Notícias' || conteudo == ''
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              conteudo = "Iniciativas";
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: conteudo == 'Iniciativas'
                                ? Colors.black
                                : Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Iniciativas',
                            style: TextStyle(
                              color: conteudo == 'Iniciativas'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      if (conteudo == 'Notícias')
                        Container(
                          height: 320,
                          width: double.infinity,
                          child: ListNewsProfile(),
                        )
                      else if (conteudo == 'Iniciativas')
                        Container(
                          height: 320,
                          width: double.infinity,
                          child: ListinitiativesProfile(),
                        )
                      else
                        Column(
                          children: [
                            Container(
                              height: 320,
                              width: double.infinity,
                              child: ListNewsProfile(),
                            ),
                          ],
                        )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
