import 'package:app/common/helpers/size.dart';
import 'package:app/common/helpers/theme.dart';
import 'package:app/common/utils/constants.dart';
import 'package:app/features/bnb/manager/models/icon_or_title_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BnbItem extends StatelessWidget {
  const BnbItem(
      {super.key,
      required this.data,
      required this.onTap,
      required this.isFocus});

  final IconOrTitleClass data;
  final VoidCallback onTap;
  final bool isFocus;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        onPressed: onTap,
        style: IconButton.styleFrom(
            shadowColor: theme.shadowColor,
            backgroundColor: theme.transparent,
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            fixedSize: Size.fromHeight(MediaQuery.of(context).size.height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.o),
            )),
        icon: Column(mainAxisSize: MainAxisSize.min, children: [
          AnimatedScale(
            duration: ConstAnimated.DURATION,
            scale: isFocus ? 1.2 : 1.0,
            child: SvgPicture.asset(
              width: 24.o,
              height: 24.o,
              data.icon ?? "",
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                isFocus ? theme.buttonColor : theme.textPrimary,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          AnimatedDefaultTextStyle(
            curve: ConstAnimated.CURVE,
            duration: ConstAnimated.DURATION,
            textAlign: TextAlign.center,
            style: theme.textStyle.copyWith(
                fontWeight: isFocus ? FontWeight.w600 : FontWeight.w400,
                color: isFocus ? theme.buttonColor : theme.textPrimary,
                fontSize: isFocus ? 14.o : 12.o),
            child: Text(data.title ?? ""),
          ),
        ]),
      ),
    );
  }
}
