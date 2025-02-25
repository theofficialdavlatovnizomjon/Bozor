import 'package:app/common/helpers/assets.dart';
import 'package:app/common/utils/utils.dart';
import 'package:app/features/auth/manager/models/login_class.dart';
import 'package:app/features/auth/manager/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider = ChangeNotifierProvider<RegisterNotifier>((ref) {
  return registerNotifier;
});

RegisterNotifier? _registerNotifier;

RegisterNotifier get registerNotifier {
  _registerNotifier ??= RegisterNotifier();
  return _registerNotifier!;
}

class RegisterNotifier with ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final returnPasswordController = TextEditingController();

  final returnPasswordFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();

  void registerInitState() {
    nameFocusNode.addListener(() => notifyListeners());
    emailFocusNode.addListener(() => notifyListeners());
    passwordFocusNode.addListener(() => notifyListeners());
    returnPasswordFocusNode.addListener(() => notifyListeners());
  }

  void registerDispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    returnPasswordController.dispose();
    returnPasswordFocusNode.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    nameFocusNode.dispose();
  }

  bool isGmail() {
    return gmailRegex.hasMatch(emailController.text);
  }
}
