import 'package:app/common/helpers/assets.dart';
import 'package:app/features/auth/manager/models/login_class.dart';
import 'package:app/features/auth/manager/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bnbProvider = ChangeNotifierProvider<BnbNotifier>((ref) {
  return bnbNotifier;
});

BnbNotifier? _bnbNotifier;

BnbNotifier get bnbNotifier {
  _bnbNotifier ??= BnbNotifier();
  return _bnbNotifier!;
}

class BnbNotifier with ChangeNotifier {
  int currentIndex = 0;

  bool isFocus(int index) => currentIndex == index;

  void onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
