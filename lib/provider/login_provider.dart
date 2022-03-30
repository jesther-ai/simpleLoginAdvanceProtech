import 'package:flutter/foundation.dart';

class LoginProvider with ChangeNotifier {
  bool _isSuccess = false;
  bool _isLoading = true;
  String _message = 'Please Wait...';
  bool _passwordObscure = true;

  //getter
  String get message => _message;
  bool get isSuccess => _isSuccess;
  bool get isLoading => _isLoading;
  bool get passwordObscure => _passwordObscure;

  //setter
  setPasswordObscure() {
    _passwordObscure = !_passwordObscure;
    notifyListeners();
  }

  sendAPI(email, password) {
    reset();
    Future.delayed(const Duration(milliseconds: 2000), () {
      _isSuccess = true;
      if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email) && password.length >= 8) {
        if (email == 'jesther@advanceprotech.com' && password == 'jesther11') {
          _message = 'Login Success\nPlease wait...';
          _isSuccess = true;
          _isLoading = false;
          notifyListeners();
        } else {
          _message = 'Wrong Email or password.';
          _isSuccess = false;
          _isLoading = false;
          notifyListeners();
        }
      }
      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
        _message = 'Invalid Email Address';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
      if (password.length < 8) {
        _message = 'Password must be\n8 characters above';
        _isSuccess = false;
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  reset() {
    _isSuccess = false;
    _isLoading = true;
    _message = 'Please Wait...';
    _passwordObscure = true;
  }
}
