import 'package:app/common/export/helper.dart';
import 'package:app/common/helpers/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingBody extends StatefulWidget {
  const SettingBody({super.key});

  @override
  State<SettingBody> createState() => _SettingBodyState();
}

class _SettingBodyState extends State<SettingBody> {
  List<String> icon = [
    Assets.icon.order,
    Assets.icon.language,
    Assets.icon.theme,
    Assets.icon.faq,
    Assets.icon.contactUs,
  ];
  List<String> title = [
    "Buyurtmalarim",
    "Ilova tili",
    "Ilova mavsumi",
    "Malumot",
    "Biz bilan boglanish"
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: title.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(0.0),
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {},
            clipBehavior: Clip.hardEdge,
            style: ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: null,
                backgroundColor: theme.white,
                foregroundColor: theme.transparent,
                shadowColor: theme.transparent,
                padding: EdgeInsets.fromLTRB(16.w, 14.h, 8.w, 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                )),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              SvgPicture.asset(
                icon[index],
                colorFilter: theme.colorFilter,
                fit: BoxFit.contain,
                height: 20.o,
                width: 20.o,
              ),
              SizedBox(width: 16.w),
              Text(title[index],
                  style: theme.textStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    color: theme.dark,
                    fontSize: 14.o,
                  )),
              Spacer(),
              SvgPicture.asset(
                Assets.icon.arrowMini,
                width: 12.o,
                height: 12.o,
                fit: BoxFit.contain,
                colorFilter: ColorFilter.mode(
                  theme.dark.withOpacity(0.5),
                  BlendMode.srcIn,
                ),
              ),
            ]),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: double.infinity, height: 2);
        },
      ),
    );
  }
}
