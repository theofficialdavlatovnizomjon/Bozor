import 'package:app/common/export/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackAppbar extends StatelessWidget {
  const BackAppbar({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.white,
      padding: EdgeInsets.fromLTRB(0, 36.o, 0, 12.o),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onTap,
            icon: Transform.rotate(
              angle: 3.14,
              child: SvgPicture.asset(
                Assets.icon.arrow,
                colorFilter: theme.colorFilter,
                fit: BoxFit.contain,
                height: 32.o,
                width: 32.o,
              ),
            ),
          ),
          Text(
            title,
            style: theme.textStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: theme.fontDudka,
              fontSize: 18.o,
            ),
          ),
          SizedBox(width: 32.o + 8.0),
        ],
      ),
    );
  }
}
