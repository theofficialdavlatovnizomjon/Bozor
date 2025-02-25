import 'package:app/common/export/helper.dart';
import 'package:app/common/helpers/theme.dart';
import 'package:app/features/bnb/manager/providers/bnb_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Appbar(),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Qidirayotkan\ntavaringiz nomini kiriting!",
                  style: theme.textStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.o,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.white,
      padding: EdgeInsets.fromLTRB(16.w, 42.h, 16.w, 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Qidiruv",
            style: theme.textStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: theme.fontDudka,
              fontSize: 20.o,
            ),
          ),
          SizedBox(height: 8.h),
          Container(
            height: 42.o,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: theme.transparent,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: theme.borderColor,
                width: 1.o,
              ),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Qidiruv...",
                isCollapsed: false,
                hintStyle: theme.textStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: theme.dark.withOpacity(0.5),
                  fontSize: 16.o,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
