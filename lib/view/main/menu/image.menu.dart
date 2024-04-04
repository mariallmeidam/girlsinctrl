import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/constants.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/models/user.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:tcc_girls_in_ctrl/view/main/profile/principal.profile.dart';

class ImageApp extends StatefulWidget {
  const ImageApp({super.key});

  @override
  State<ImageApp> createState() => _ImageAppState();
}

class _ImageAppState extends State<ImageApp> {
  User? user;
  bool loading = true;
  File? _imageFile;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String conteudo = '';

  void getUser() async {
    // Obtem dados do usuário
    ApiResponse response = await getUserDetail();
    // Isso obtem uma resposta que será verificada
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;

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
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: _imageFile == null
              ? user?.image != null
                  ? DecorationImage(
                      image: NetworkImage('${user?.image ?? ''}'),
                      fit: BoxFit.cover)
                  : null
              : DecorationImage(
                  image: FileImage(_imageFile ?? File('')),
                  fit: BoxFit.cover,
                ),
          color: Colors.black12,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PrincipalProfile()),
        );
      },
    );
  }
}
