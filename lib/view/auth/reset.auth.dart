import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/models/user.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/cadastrar.auth.dart';
import 'package:tcc_girls_in_ctrl/view/auth/entrar.auth.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/principal.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/principal.menu.dart';
import 'package:tcc_girls_in_ctrl/view/themes/light.theme.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/botton.widgets.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/text.widgets.dart';

import '../../controllers/services.controllers.dart';

class TelaReset extends StatefulWidget {
  const TelaReset({super.key});

  @override
  State<TelaReset> createState() => _TelaResetState();
}

class _TelaResetState extends State<TelaReset> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtCod = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtPasswordConfirmation = TextEditingController();

  bool loading = false;

  // Validação de forget
  void _reset() async {
    ApiResponse response = await reset(
      txtEmail.text,
      txtCod.text,
      txtPassword.text,
      txtPasswordConfirmation.text,
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
        MaterialPageRoute(builder: (context) => TelaEntrar()),
        (route) => false);
  }

  String? Function(String?) validatorEmail =
      (val) => val!.isEmpty ? 'Email inválido' : null;

  String? Function(String?) validatorPassword =
      (val) => val!.length < 6 ? 'Requer 6 caractéres!' : null;

  String? Function(String?) validatorCod =
      (val) => val!.length > 4 ? 'Requer 4 caractéres!' : null;

  String? Function(String? p1) passwordConfirmation() {
    validatorPasswordConfirmation(val) =>
        val != txtPassword.text ? 'As senhas devem ser iguais!' : null;

    return validatorPasswordConfirmation;
  }

  void _button() {
    if (formkey.currentState!.validate()) {
      setState(() {
        loading = true;
        _reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                height: size(context, 0.2),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Redefinição de Senha",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Insira abaixo o código enviado no seu email, e altera sua senha.",
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
                      height: size(context, 0.8),
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
                                    name: "Código",
                                    txt: txtCod,
                                    type: TextInputType.number,
                                    validator: validatorCod,
                                    obscure: false,
                                    showIcon: false,
                                  ),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  TextBoxWidget(
                                    name: "Email",
                                    txt: txtEmail,
                                    type: TextInputType.emailAddress,
                                    validator: validatorEmail,
                                    obscure: false,
                                    showIcon: false,
                                  ),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  TextBoxWidget(
                                    name: "Senha",
                                    txt: txtPassword,
                                    type: null,
                                    validator: validatorPassword,
                                    obscure: true,
                                    showIcon: true,
                                  ),
                                  const SizedBox(
                                    height: 26,
                                  ),
                                  TextBoxWidget(
                                    name: "Confirmação Senha",
                                    txt: txtPasswordConfirmation,
                                    type: null,
                                    validator: passwordConfirmation(),
                                    obscure: true,
                                    showIcon: true,
                                  ),
                                  const SizedBox(
                                    height: 15,
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
