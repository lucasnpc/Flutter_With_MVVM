import 'package:api_example/ui/Login/store/LoginStore.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  Dio dio;
  LoginStore store;
  final url = "";

  LoginRepository([Dio client, LoginStore _store]) {
    dio = client ?? Dio();
    store = _store;
  }

  Future login(String user, String pass) async {
    if (user != "devmobile" || pass != "globalweb") {
      store.setLoginResult(false, true, null);
      return;
    }
    store.setLoginResult(true, false, "123");
  }
}
