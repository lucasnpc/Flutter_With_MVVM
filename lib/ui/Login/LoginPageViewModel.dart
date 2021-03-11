import 'package:api_example/data/LoginRepository.dart';
import 'package:api_example/ui/Login/LoginState.dart';
import 'package:api_example/ui/Login/store/LoginResultStore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPageViewModel extends ChangeNotifier {
  final state = ValueNotifier<LoginState>(null);
  LoginResultStore result;
  var _context;

  LoginPageViewModel(BuildContext context) {
    _context = context;
    result = Provider.of<LoginResultStore>(_context);
  }

  Future<void> login(String user, String pass) async {
    state.value = LoginState.isLoading;
    print(state.value);
    await LoginRepository().login(user, pass, result, state);
  }
}
