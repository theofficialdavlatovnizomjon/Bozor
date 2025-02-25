import 'package:app/common/export/helper.dart';
import 'package:app/components/custom_bottom_sheet.dart';
import 'package:app/features/profile/pages/apptheme/apptheme.dart';
import 'package:app/features/profile/pages/contact_us/contact_us.dart';
import 'package:app/features/profile/pages/logout/logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

mixin ProfileMixin {
  language(BuildContext context) {
    return showModalBottomSheet(
      elevation: 0,
      context: context,
      backgroundColor: theme.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(),
          ],
        );
      },
    );
  }

  appTheme(BuildContext context) {
    return customBottomSheet(
      context: context,
      widget: AppTheme(),
      title: "Ilova mavsumi",
    );
  }

  logout(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Logout();
      },
    );
  }
  contactUs(BuildContext context) {
    return customBottomSheet(
      context: context,
      widget: ContactUs(),
      title: "Biz bilan boglanish",
    );
  }
}
