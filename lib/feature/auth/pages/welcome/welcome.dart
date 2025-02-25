import 'package:app/common/export/helper.dart';
import 'package:app/components/custom_button.dart';
import 'package:app/features/auth/manager/models/login_class.dart';
import 'package:app/features/auth/pages/login/login.dart';
import 'package:app/features/auth/pages/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final data = LoginClass(
    image: Assets.icon.market,
    title: "Bozor app dasturiga hush kelibsiz!",
    subtitle: "Dasturga kirish uchun Login parolizni kiring yoki"
        " ro'yxatdan o'ting.",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theme.appbar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                data.image,
                fit: BoxFit.contain,
                height: 180.o,
                width: 180.o,
              ),
            ),
            SizedBox(height: 46.h),
            Text(
              data.title,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: theme.textStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontFamily: theme.fontDudka,
                fontSize: 20.o,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              maxLines: 5,
              data.subtitle,
              textAlign: TextAlign.start,
              style: theme.textStyle.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.o,
              ),
            ),
            SizedBox(height: 46.h),
            CustomButton(
              title: "Men yangi odamman",
              shadowColor: theme.transparent,
              backgroundColor: theme.transparent,
              foregroundColor: theme.transparent,
              borderSide: BorderSide(color: theme.buttonColor, width: 1.o),
              onTap: () => onNewUser(context),
              textStyle: theme.textStyle.copyWith(
                color: theme.textPrimary,
                fontWeight: FontWeight.w500,
                fontSize: 16.o,
              ),
            ),
            SizedBox(height: 8.o),
            CustomButton(
              title: "Menda allaqachon hisob bor",
              onTap: () => onOldUser(context),
            ),
          ],
        ),
      ),
    );
  }

  void onNewUser(BuildContext context) => pushTo(const RegisterPage(), context);

  void onOldUser(BuildContext context) => pushTo(LoginPage(), context);
}
