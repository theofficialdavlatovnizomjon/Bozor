import 'dart:io';
import 'package:app/common/export/helper.dart';
import 'package:app/components/custom_button.dart';
import 'package:app/features/auth/manager/providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theme.appbar,
      extendBodyBehindAppBar: true,
      body: Consumer(
        builder: (context, ref, child) {
          final notifier = ref.watch(loginProvider);
          return Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 420.h,
                width: double.infinity,
                child: Image.asset(Assets.image.logo, fit: BoxFit.cover),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  enter.tr,
                  textAlign: TextAlign.start,
                  style: theme.textStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontFamily: theme.fontDudka,
                    fontSize: 24.o,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Text(
                  maxLines: 3,
                  appWelcomeMessage.tr,
                  textAlign: TextAlign.start,
                  style: theme.textStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.o,
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomButton(
                  iconSize: 38.o,
                  icon: Assets.icon.google,
                  title: loginWithGoogle.tr,
                  backgroundColor: theme.blue,
                  foregroundColor: theme.transparent,
                  shadowColor: theme.blue,
                  onTap: notifier.onSignInWithGoogle,
                  textStyle: theme.textStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    color: theme.white,
                    fontSize: 16.o,
                  ),
                ),
              ),
              if (Platform.isIOS) SizedBox(height: 16.h),
              if (Platform.isIOS)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomButton(
                    iconSize: 38.o,
                    icon: Assets.icon.apple,
                    title: loginWithAppleId.tr,
                    foregroundColor: theme.transparent,
                    backgroundColor: theme.dark,
                    shadowColor: theme.dark,
                    onTap: notifier.onSignInWithGoogle,
                    textStyle: theme.textStyle.copyWith(
                      color: theme.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.o,
                    ),
                  ),
                ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 240.w,
                  child: Text(
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    "Dasturga kirish orqalik siz Mexfiylik siyosatini qabul qilasiz",
                    style: theme.textStyle.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.o,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          );
        },
      ),
    );
  }
}
