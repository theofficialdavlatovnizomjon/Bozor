import 'package:app/common/export/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () => _logout(context),
          borderRadius: BorderRadius.circular(8.o),
          child: Padding(
            padding: EdgeInsets.fromLTRB(8.w, 4.h, 8.w, 4.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  Assets.icon.logout,
                  colorFilter: ColorFilter.mode(theme.red, BlendMode.srcIn),
                  fit: BoxFit.contain,
                  height: 24.o,
                  width: 24.o,
                ),
                SizedBox(width: 8.w),
                Text(
                  "Chiqish",
                  style: theme.textStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.o,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _logout(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        elevation: 0,
        backgroundColor: theme.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 38.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.o),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Assets.icon.logout,
                colorFilter: ColorFilter.mode(theme.red, BlendMode.srcIn),
                fit: BoxFit.contain,
                height: 64.o,
                width: 64.o,
              ),
              SizedBox(height: 16.h),
              Text(
                "Siz rostdanham dasturdan chiqmoqchimisiz?",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: theme.textStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.o,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => pop(context),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          backgroundColor: theme.green,
                          foregroundColor: theme.white,
                          fixedSize: Size.fromHeight(42.o),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          )),
                      child: Text(
                        "Yo'q",
                        style: theme.textStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: theme.white,
                          fontSize: 16.o,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          backgroundColor: theme.red,
                          foregroundColor: theme.white,
                          fixedSize: Size.fromHeight(42.o),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          )),
                      child: Text(
                        "Ha",
                        style: theme.textStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: theme.white,
                          fontSize: 16.o,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
