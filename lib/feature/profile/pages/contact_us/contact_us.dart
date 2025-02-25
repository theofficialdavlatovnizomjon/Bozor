import 'package:app/common/export/helper.dart';
import 'package:app/common/utils/utils.dart';
import 'package:app/features/profile/manager/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final notifier = ref.watch(profileProvider);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 32.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _item(
                icon: Assets.icon.telegram,
                backgroundColor: theme.blue,
                onTap: () => goToLink(notifier.contactUsData?.telegram ?? ''),
                context,
              ),
              SizedBox(width: 16.w),
              _item(
                icon: Assets.icon.instagram,
                backgroundColor: theme.dark,
                onTap: () => goToLink(notifier.contactUsData?.instagram ?? ''),
                context,
              ),
              SizedBox(width: 16.w),
              _item(
                icon: Assets.icon.call,
                backgroundColor: theme.green,
                onTap: () => goToPhone(notifier.contactUsData?.phone ?? ''),
                context,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _item(BuildContext context,
      {required String icon,
      required Color backgroundColor,
      required VoidCallback onTap}) {
    return IconButton(
      onPressed: () {
        pop(context);
        onTap();
      },
      style: IconButton.styleFrom(
          elevation: 0,
          fixedSize: Size(52.o, 52.o),
          padding: EdgeInsets.all(8.0),
          foregroundColor: theme.white,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(theme.white, BlendMode.srcIn),
        fit: BoxFit.contain,
      ),
    );
  }
}
