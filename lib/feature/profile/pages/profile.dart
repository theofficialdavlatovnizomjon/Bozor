import 'package:app/common/export/helper.dart';
import 'package:app/features/profile/manager/mixin/profile_mixin.dart';
import 'package:app/features/profile/manager/providers/profile_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'faq/faq.dart';
import 'my_order/my_order.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with ProfileMixin {
  @override
  void initState() {
    profileNotifier.getContactUsData();
    super.initState();
  }

  List<String> icon = [
    Assets.icon.order,
    Assets.icon.theme,
    Assets.icon.faq,
    Assets.icon.contactUs,
    Assets.icon.logout,
  ];
  List<String> title = [
    "Buyurtmalarim",
    "Ilova mavsumi",
    "Malumot",
    "Biz bilan boglanish",
    "Profildan chiqish",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Appbar(),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final notifier = ref.watch(profileProvider);
              return RefreshIndicator.adaptive(
                color: theme.dark,
                backgroundColor: theme.gray,
                onRefresh: () async {},
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: title.length,
                  padding: EdgeInsets.zero,
                  separatorBuilder: _separatorBuilder,
                  itemBuilder: _itemBuilder,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _itemBuilder(context, index) {
    return ElevatedButton(
      onPressed: () {
        switch (index) {
          case 0:
            pushTo(MyOrder(), context);
          case 1:
            appTheme(context);
          case 2:
            pushTo(Faq(), context);
          case 3:
            contactUs(context);
          case 4:
            logout(context);
        }
      },
      clipBehavior: Clip.hardEdge,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: null,
          backgroundColor: theme.white,
          foregroundColor: theme.transparent,
          shadowColor: theme.transparent,
          padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          )),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        SvgPicture.asset(
          icon[index],
          width: 20.o,
          height: 20.o,
          fit: BoxFit.contain,
          colorFilter: ColorFilter.mode(
            index != 5 ? theme.dark : theme.red,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 16.w),
        Text(
          title[index],
          style: theme.textStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.dark,
            fontSize: 14.o,
          ),
        ),
        const Spacer(),
        if (index != 5)
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
  }

  Widget _separatorBuilder(context, index) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 2,
    );
  }
}

class _Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: theme.green,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 32.h, 0, 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shaxsiy Kabinet",
            style: theme.textStyle.copyWith(
              fontWeight: FontWeight.w600,
              fontFamily: theme.fontDudka,
              color: Colors.white,
              fontSize: 20.o,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Container(
                width: 60.o,
                height: 60.o,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF0F4F1),
                ),
                child: CachedNetworkImage(
                  imageUrl: "",
                  errorWidget: (context, image, object) {
                    return Padding(
                      padding: EdgeInsets.all(16.o),
                      child: SvgPicture.asset(
                        Assets.icon.person,
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nizomjon D.",
                      style: theme.textStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 15.o,
                      ),
                    ),
                    Text(
                      "ID: 174",
                      style: theme.textStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 12.o,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                    backgroundColor: theme.transparent,
                    padding: EdgeInsets.zero,
                    elevation: 0),
                icon: SvgPicture.asset(
                  Assets.icon.edit,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  fit: BoxFit.contain,
                  height: 20.o,
                  width: 20.o,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
