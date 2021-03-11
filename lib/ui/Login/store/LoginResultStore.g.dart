// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResultStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginResultStore on _LoginResultStore, Store {
  final _$_successAtom = Atom(name: '_LoginResultStore._success');

  @override
  bool get _success {
    _$_successAtom.reportRead();
    return super._success;
  }

  @override
  set _success(bool value) {
    _$_successAtom.reportWrite(value, super._success, () {
      super._success = value;
    });
  }

  final _$_failedAtom = Atom(name: '_LoginResultStore._failed');

  @override
  bool get _failed {
    _$_failedAtom.reportRead();
    return super._failed;
  }

  @override
  set _failed(bool value) {
    _$_failedAtom.reportWrite(value, super._failed, () {
      super._failed = value;
    });
  }

  final _$_tokenAtom = Atom(name: '_LoginResultStore._token');

  @override
  String get _token {
    _$_tokenAtom.reportRead();
    return super._token;
  }

  @override
  set _token(String value) {
    _$_tokenAtom.reportWrite(value, super._token, () {
      super._token = value;
    });
  }

  final _$_LoginResultStoreActionController =
      ActionController(name: '_LoginResultStore');

  @override
  void setLoginResult(bool success, bool failed, String token) {
    final _$actionInfo = _$_LoginResultStoreActionController.startAction(
        name: '_LoginResultStore.setLoginResult');
    try {
      return super.setLoginResult(success, failed, token);
    } finally {
      _$_LoginResultStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
