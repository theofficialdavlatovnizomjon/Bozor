import 'dart:async';

import 'package:app/common/export/helper.dart';
import 'package:app/common/keys/user_info_keys.dart';
import 'package:app/common/keys/shared_preferences_helper.dart';
import 'package:app/features/auth/pages/login/login.dart';
import 'package:app/features/bnb/pages/bnb.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Timer _timer;
  String token = pref.getString(UserInfoKeys.token) ?? '';

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      pushToUtil(
        token.isEmpty ? LoginPage() : const BnbPage(),
        context,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theme.appbar,
      backgroundColor: theme.buttonColor,
      body: Center(
        child: Image.asset(
          Assets.image.logo,
        ),
      ),
    );
  }
}
