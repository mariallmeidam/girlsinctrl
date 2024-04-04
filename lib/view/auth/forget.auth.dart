import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/models/user.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/cadastrar.auth.dart';
import 'package:tcc_girls_in_ctrl/view/auth/reset.auth.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/principal.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/principal.menu.dart';
import 'package:tcc_girls_in_ctrl/view/themes/light.theme.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/botton.widgets.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/text.widgets.dart';

import '../../controllers/services.controllers.dart';

class TelaForget extends StatefulWidget {
  const TelaForget({super.key});

  @override
  State<TelaForget> createState() => _TelaForgetState();
}

class _TelaForgetState extends State<TelaForget> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  bool loading = false;

  // Validação de forget
  void _forget() async {
    ApiResponse response = await forget(
      txtEmail.text,
    );

    // Salva ou não valores temporários
    if (response.error == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.data}')));
      _redirect();
    } else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  void _redirect() async {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => TelaReset()), (route) => false);
  }

  String? Function(String?) validatorEmail =
      (val) => val!.isEmpty ? 'Email inválido' : null;

  void _button() {
    if (formkey.currentState!.validate()) {
      setState(() {
        loading = true;
        _forget();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
        title: Container(
          width: double.infinity,
          alignment: Alignment.centerRight,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 30,
                ),
                height: size(context, 0.3),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Esqueceu sua senha?",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Tudo bem girl! Digite abaixo o email cadastrado no aplicativo para poder alterar sua senha. Iremos enviar um código de autorização para esse email.",
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: size(context, 0.7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            Form(
                              key: formkey,
                              child: Column(
                                children: [
                                  TextBoxWidget(
                                    name: "Email",
                                    txt: txtEmail,
                                    type: TextInputType.emailAddress,
                                    validator: validatorEmail,
                                    obscure: false,
                                    showIcon: false,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            loading
                                ? Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : bottonPadrao(
                                    50,
                                    double.infinity,
                                    Colors.black,
                                    Colors.white,
                                    "Enviar",
                                    context,
                                    _button,
                                  ),
                          ],
                        ),
                      ),
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
