import 'package:app/common/helpers/size.dart';
import 'package:app/common/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.size,
      this.textStyle,
      this.borderSide,
      this.colorFilter,
      this.borderRadius,
      this.backgroundColor,
      this.foregroundColor,
      this.shadowColor,
      this.iconSize,
      this.angle,
      this.onTap,
      this.title,
      this.icon});

  final Size? size;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final BorderRadius? borderRadius;
  final ColorFilter? colorFilter;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final VoidCallback? onTap;
  final double? iconSize;
  final double? angle;
  final String? title;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          shadowColor: shadowColor ?? theme.shadowColor,
          foregroundColor: foregroundColor ?? theme.foregroundColor,
          disabledBackgroundColor: theme.disabledBackgroundColor,
          backgroundColor: backgroundColor ?? theme.buttonColor,
          fixedSize: size ?? Size(MediaQuery.of(context).size.width, 48.o),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(50.o),
            side: borderSide ?? BorderSide.none,
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon?.isNotEmpty ?? false)
            Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Transform.rotate(
                angle: angle ?? 0,
                child: SvgPicture.asset(
                  icon ?? '',
                  fit: BoxFit.contain,
                  colorFilter: colorFilter,
                  height: iconSize ?? 24.o,
                  width: iconSize ?? 24.o,
                ),
              ),
            ),
          Text(
            title ?? '',
            style: textStyle ??
                theme.textStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.o,
                ),
          ),
        ],
      ),
    );
  }
}
