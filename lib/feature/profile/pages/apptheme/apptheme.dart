import 'package:app/common/export/helper.dart';
import 'package:app/common/keys/shared_preferences_helper.dart';
import 'package:app/common/keys/system_keys.dart';
import 'package:app/features/bnb/manager/providers/bnb_provider.dart';
import 'package:app/features/bnb/pages/bnb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppTheme extends StatefulWidget {
  const AppTheme({super.key});

  @override
  State<AppTheme> createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _checker();
  }

  void _checker() async {
    bool checker = await pref.getBool(SystemKeys.theme) ?? false;
    _index = checker ? 1 : 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: _itemBuilder,
      shrinkWrap: true,
      itemCount: 2,
    );
  }

  Widget _itemBuilder(context, index) {
    return InkWell(
      onTap: () {
        isDark = index == 0 ? false : true;
        pref.setBool(SystemKeys.theme, isDark);
        bnbNotifier.onTap(4);
        updateTheme();
        pushToNotAnimation(BnbPage(), context);
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
        child: Row(
          children: [
            Text(
              ["Kunduzgi", "Tungi"][index],
              style: theme.textStyle.copyWith(
                fontWeight: FontWeight.w400,
                fontFamily: theme.fontDudka,
                fontSize: 16.o,
              ),
            ),
            const Spacer(),
            if (_index == index)
              SvgPicture.asset(
                Assets.icon.check,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(theme.green, BlendMode.srcIn),
                height: 20.o,
                width: 20.o,
              ),
          ],
        ),
      ),
    );
  }
}
