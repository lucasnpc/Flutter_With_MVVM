import 'package:api_example/ui/Home/HomePage.dart';
import 'package:api_example/ui/Login/LoginState.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:toast/toast.dart';

import 'LoginPageViewModel.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final form_key = GlobalKey<FormState>();
  var vm;

  String user = "";
  String pass = "";

  @override
  void initState() {
    super.initState();
  }

  _body() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(40),
            child: Form(
                key: form_key,
                child: Column(
                  children: [
                    Text("Sign up"),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Usuário",
                          labelStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          )),
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Usuário inválido';
                        else
                          return null;
                      },
                      onChanged: (value) {
                        user = value;
                      },
                    ),
                    TextFormField(
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                        validator: (value) {
                          if (value.isEmpty)
                            return 'Senha inválida';
                          else
                            return null;
                        },
                        onChanged: (value) {
                          pass = value;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () async {
                        vm.login(user, pass);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).primaryColor)),
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }

  _isLoading() {
    return Center(child: CircularProgressIndicator());
  }

  stateManager(LoginState state) {
    switch (state) {
      case LoginState.isLoading:
        {
          print('loading true');
          return _isLoading();
        }
      default:
        {
          print('loading false');
          return _body();
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    vm = LoginPageViewModel(context);
    return AnimatedBuilder(
        animation: vm.state,
        builder: (context, child) {
          when((_) => vm.result.getResultToken() == "123",
              () => successLogin(context));
          when((_) => vm.result.getResultFailed() == true,
              () => failedLogin(context));
          return Scaffold(body: stateManager(vm.state.value));
        });
  }

  successLogin(BuildContext context) {
    vm.result.setLoginResult(true, false, "123");
    print(vm.result.getResultFailed());
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  failedLogin(BuildContext context) {
    vm.result.setLoginResult(false, false, null);
    Toast.show('Usuário e/ou senha incorretos', context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }
}
