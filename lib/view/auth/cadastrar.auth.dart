import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcc_girls_in_ctrl/controllers/services.controllers.dart';
import 'package:tcc_girls_in_ctrl/models/response.models.dart';
import 'package:tcc_girls_in_ctrl/models/user.models.dart';
import 'package:tcc_girls_in_ctrl/view/auth/entrar.auth.dart';
import 'package:tcc_girls_in_ctrl/view/main/home/principal.home.dart';
import 'package:tcc_girls_in_ctrl/view/main/menu/principal.menu.dart';
import 'package:tcc_girls_in_ctrl/view/themes/light.theme.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/botton.widgets.dart';
import 'package:tcc_girls_in_ctrl/view/widgets/text.widgets.dart';

class TelaCadastrar extends StatefulWidget {
  const TelaCadastrar({super.key});

  @override
  State<TelaCadastrar> createState() => _TelaCadastrarState();
}

class _TelaCadastrarState extends State<TelaCadastrar> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;
  TextEditingController nameController = TextEditingController(),
      lastnameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      passwordConfirmController = TextEditingController();

  // Validação de registros
  void _registerUser() async {
    // Pega valores inseridos e envia para a função register
    ApiResponse response = await register(
      nameController.text,
      lastnameController.text,
      emailController.text,
      passwordController.text,
    );

    // Salva ou não valores temporários
    if (response.error == null) {
      _saveAndRedirect(response.data as User);
    } else {
      setState(() {
        loading = !loading;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  // Salva o id e token temporariamente
  void _saveAndRedirect(User user) async {
    // Pega os valores do usuário temposáriamente
    SharedPreferences pref = await SharedPreferences.getInstance();

    // Salva os valores de id e token
    await pref.setString('token', user.token ?? '');
    await pref.setInt('userId', user.id ?? 0);

    // Remove rotas anteriores e envia para a nova página
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => PrincipalMenu()),
        (route) => false);
  }

  String? Function(String?) validatorName =
      (val) => val!.isEmpty ? 'Nome inválido' : null;

  String? Function(String?) validatorEmail =
      (val) => val!.isEmpty ? 'Email inválido!' : null;

  String? Function(String?) validatorPassword =
      (val) => val!.length < 6 ? 'Requer 6 caractéres!' : null;

  String? Function(String? p1) passwordConfirmation() {
    validatorPasswordConfirmation(val) =>
        val != passwordController.text ? 'As senhas devem ser iguais!' : null;

    return validatorPasswordConfirmation;
  }

  void _button() {
    if (formKey.currentState!.validate()) {
      setState(() {
        loading = true;
        _registerUser();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
          child: InkWell(
            child: Text(
              'Entrar',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaEntrar()),
              );
            },
          ),
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
                      "Cadastrar",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            color: Colors.black,
                          ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Olá Girl, que bom ter você aqui!",
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
                      height: size(context, 0.8),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 40),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextBoxWidget(
                                  name: "Nome",
                                  txt: nameController,
                                  type: null,
                                  validator: validatorName,
                                  obscure: false,
                                  showIcon: false,
                                ),
                                const SizedBox(
                                  height: 26,
                                ),
                                TextBoxWidget(
                                  name: "Último Nome",
                                  txt: lastnameController,
                                  type: null,
                                  validator: validatorName,
                                  obscure: false,
                                  showIcon: false,
                                ),
                                const SizedBox(
                                  height: 26,
                                ),
                                TextBoxWidget(
                                  name: "Email",
                                  txt: emailController,
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
                                  txt: passwordController,
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
                                  txt: passwordConfirmController,
                                  type: null,
                                  validator: passwordConfirmation(),
                                  obscure: true,
                                  showIcon: true,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const SizedBox(
                                  height: 30,
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
                                        "Cadastrar",
                                        context,
                                        _button,
                                      ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
