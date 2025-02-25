import 'package:app/common/helpers/assets.dart';
import 'package:app/common/helpers/navigator.dart';
import 'package:app/common/helpers/theme.dart';
import 'package:app/common/helpers/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<void> customBottomSheet(
    {required BuildContext context,
    required Widget widget,
    required String title}) {
  return showModalBottomSheet(
      elevation: 0,
      context: context,
      backgroundColor: theme.gray,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 0, 8.h),
            decoration: BoxDecoration(
              color: theme.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16.0),
              ),
            ),
            child: Row(children: [
              Text(title,
                  style: theme.textStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.o,
                  )),
              const Spacer(),
              IconButton(
                onPressed: () => pop(context),
                icon: SvgPicture.asset(
                  Assets.icon.close,
                  colorFilter: theme.colorFilter,
                  fit: BoxFit.contain,
                  height: 20.o,
                  width: 20.o,
                ),
              ),
            ]),
          ),
          widget,
        ]);
      });
}
