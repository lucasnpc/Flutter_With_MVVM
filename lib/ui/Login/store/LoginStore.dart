import 'package:mobx/mobx.dart';
part 'LoginStore.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  var _success = false;
  @observable
  var _failed = false;
  @observable
  var _token = "";

  @action
  void setLoginResult(bool success, bool failed, String token) {
    _success = success;
    _failed = failed;
    _token = token;
  }
}
