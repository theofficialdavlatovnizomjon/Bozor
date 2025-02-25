import 'package:app/common/helpers/assets.dart';
import 'package:app/common/helpers/size.dart';
import 'package:app/common/helpers/theme.dart';
import 'package:app/features/bnb/manager/providers/bnb_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoriesAppbar extends StatelessWidget {
  const CategoriesAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.white,
      padding: EdgeInsets.fromLTRB(16.w, 42.h, 16.w, 12.h),
      child: Row(
        children: [
          Text(
            "Kategoriya",
            style: theme.textStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: theme.fontDudka,
              fontSize: 20.o,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => bnbNotifier.onTap(1),
            style: IconButton.styleFrom(
                backgroundColor: theme.transparent,
                padding: EdgeInsets.zero,
                elevation: 0),
            icon: SvgPicture.asset(
              Assets.icon.search,
              fit: BoxFit.contain,
              colorFilter: theme.colorFilter,
              height: 20.o,
              width: 20.o,
            ),
          ),
        ],
      ),
    );
  }
}
