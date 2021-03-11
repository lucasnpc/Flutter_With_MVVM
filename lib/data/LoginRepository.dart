import 'package:api_example/ui/Login/LoginState.dart';
import 'package:api_example/ui/Login/store/LoginResultStore.dart';
import 'package:flutter/material.dart';

class LoginRepository {
  final url = "";

  Future login(String user, String pass, LoginResultStore store,
      ValueNotifier<LoginState> state) async {
    print(user + ' ' + pass);
    await Future.delayed(new Duration(milliseconds: 1500));
    if (user != "devmobile" || pass != "globalweb") {
      store.setLoginResult(false, true, null);
      state.value = null;
      return;
    }
    store.setLoginResult(true, false, "123");
  }
}
