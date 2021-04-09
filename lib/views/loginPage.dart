import 'package:flutter/material.dart';
import 'package:mstoreapp/views/homePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final txtLogin = TextEditingController();
  final txtPassword = TextEditingController();

  iconLogin() {
    return Icon(
      Icons.account_circle_outlined,
      size: 60.0,
      color: Colors.red,
    );
  }

  textForm(String textLabel,
      {TextEditingController textEditingController,
      String placeHolderTxt = "",
      bool senha = false,
      FormFieldValidator<String> validator}) {
    return TextFormField(
      controller: textEditingController,
      decoration:
          InputDecoration(labelText: textLabel, hintText: placeHolderTxt),
      obscureText: senha,
      validator: validator,
    );
  }

  buttonForm() {
    return Container(
      child: ElevatedButton(
          child: Text("Logar"), onPressed: () => {_navegarHome(context)}),
    );
  }

  _navegarHome(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  String _validalogin(String texto) {
    if (texto.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validaSenha(String texto) {
    if (texto.isEmpty) {
      return "Digite a seha";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
            children: [
              iconLogin(),
              textForm("E-mail",
                  placeHolderTxt: "Digite o e-mail",
                  textEditingController: txtLogin,
                  validator: _validalogin),
              textForm("Password",
                  placeHolderTxt: "Digite a senha",
                  textEditingController: txtPassword,
                  validator: _validaSenha,
                  senha: true),
              Container(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              ),
              buttonForm()
            ],
          ),
        ));
  }
}
