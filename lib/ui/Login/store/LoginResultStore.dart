import 'package:mobx/mobx.dart';
part 'LoginResultStore.g.dart';

class LoginResultStore = _LoginResultStore with _$LoginResultStore;

abstract class _LoginResultStore with Store {
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

  getResultSuccess() {
    return _success;
  }

  getResultFailed() {
    return _failed;
  }

  getResultToken() {
    return _token;
  }
}
