import 'dart:io';

import 'package:app/common/export/helper.dart';
import 'package:app/components/custom_button.dart';
import 'package:flutter/cupertino.dart';

class LoginButtonStatus extends StatelessWidget {
  const LoginButtonStatus(
      {super.key,
      required this.onLogin,
      required this.onApple,
      required this.onRegister,
      required this.isLogin});

  final VoidCallback onLogin;
  final VoidCallback onApple;
  final VoidCallback onRegister;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 450),
            child: loginBtn,
          ),
          if (isLogin)
            CustomButton(
              onTap: () {},
              title: "Men yangi odamman",
              shadowColor: theme.transparent,
              backgroundColor: theme.transparent,
              foregroundColor: theme.transparent,
              borderSide: BorderSide(color: theme.buttonColor, width: 1.o),
              textStyle: theme.textStyle.copyWith(
                color: theme.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 16.o,
              ),
            ),
          SizedBox(height: 8.o),
          CustomButton(
            onTap: () {},
            title: "Menda allaqachon hisob bor",
          ),
          SizedBox(height: 46.h),
        ],
      ),
    );
  }

  Widget get loginBtn {
    if (isLogin) return SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
          onTap: onLogin,
          title: "Men yangi odamman",
          shadowColor: theme.transparent,
          backgroundColor: theme.transparent,
          foregroundColor: theme.transparent,
          borderSide: BorderSide(color: theme.buttonColor, width: 1.o),
          textStyle: theme.textStyle.copyWith(
            color: theme.textPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 16.o,
          ),
        ),
        if (Platform.isIOS) SizedBox(height: 8.o),
        if (Platform.isIOS)
          CustomButton(
            onTap: onApple,
            title: "Men yangi odamman",
            shadowColor: theme.transparent,
            backgroundColor: theme.transparent,
            foregroundColor: theme.transparent,
            borderSide: BorderSide(color: theme.buttonColor, width: 1.o),
            textStyle: theme.textStyle.copyWith(
              color: theme.textPrimary,
              fontWeight: FontWeight.w500,
              fontSize: 16.o,
            ),
          ),
      ],
    );
  }
}
