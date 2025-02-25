import 'package:app/common/helpers/size.dart';
import 'package:app/common/helpers/theme.dart';
import 'package:app/features/auth/manager/models/login_class.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class LoginItem extends StatelessWidget {
  const LoginItem({super.key, required this.data, required this.focus});

  final LoginClass data;
  final bool focus;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: focus ? 1 : 0,
      duration: Duration(milliseconds: 450),
      curve: Curves.decelerate,
      child: Padding(
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
          ],
        ),
      ),
    );
  }
}
