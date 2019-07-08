import 'dart:async';
import 'package:flutter_app/Source/Validators/Validation.dart';


class LoginBloc {
  StreamController _userController = new StreamController();
  StreamController _passwordController = new StreamController();

  Stream get userStream => _userController.stream;
  Stream get passwordStream => _passwordController.stream;


  bool isValidInfo(String userName, String password) {
    if(!Validation.isValidateUser(userName)) {
      _userController.sink.addError("Tài khoản không hợp lệ!");
      return false;
    }
    _userController.sink.add("OK");

    if(!Validation.isValidatePassword(password)) {
      _passwordController.sink.addError("Mật khẩu lớn hơn 8 ký tự");
      return false;
    }
    _passwordController.sink.add("OK");
    return true;

  }

  void disponse() {
    _userController.close();
    _passwordController.close();
  }
}