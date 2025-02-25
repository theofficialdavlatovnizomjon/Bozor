import 'package:app/common/helpers/assets.dart';
import 'package:app/features/auth/manager/models/login_class.dart';
import 'package:app/features/auth/manager/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = ChangeNotifierProvider<LoginNotifier>((ref) {
  return loginNotifier;
});

LoginNotifier? _loginNotifier;

LoginNotifier get loginNotifier {
  _loginNotifier ??= LoginNotifier();
  return _loginNotifier!;
}

class LoginNotifier with ChangeNotifier {
  LoginNotifier() : super() {}

  // final _authService = AuthService();

  void onSignInWithGoogle() async {
    // final user = await _authService.signInWithGoogle();
    // if (user != null) {
    //   debugPrint("Signed in as: ${user.displayName}");
    // }
  }

  void onSignInWithApple() {}
}
