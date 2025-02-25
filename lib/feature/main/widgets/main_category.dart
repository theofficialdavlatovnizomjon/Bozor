import 'package:app/common/export/helper.dart';
import 'package:app/features/bnb/manager/providers/bnb_provider.dart';
import 'package:app/features/main/manager/providers/home_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainCategory extends StatelessWidget {
  const MainCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final notifier = ref.watch(homeProvider);
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Text(
                    "Kategoriyalar",
                    style: theme.textStyle.copyWith(
                      fontFamily: theme.fontDudka,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.o,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => bnbNotifier.onTap(2),
                    borderRadius: BorderRadius.circular(8.0),
                    child: Row(
                      children: [
                        Text(
                          "Barchasi",
                          style: theme.textStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.o,
                          ),
                        ),
                        SvgPicture.asset(
                          Assets.icon.arrow,
                          colorFilter: theme.colorFilter,
                          fit: BoxFit.contain,
                          height: 32.o,
                          width: 32.o,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            GridView.builder(
              shrinkWrap: true,
              itemCount: notifier.categoriesData.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 130.o,
                mainAxisSpacing: 12.o,
                crossAxisSpacing: 12.o,
                childAspectRatio: 1,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                final data = notifier.categoriesData[index];
                return GestureDetector(
                  onTap: () {
                    /// TODO: Bu yerda push qilip ketaman!
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: CachedNetworkImage(
                          height: 90.o,
                          width: double.infinity,
                          imageUrl: data.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 4.o),
                      Expanded(
                        child: Text(
                          data.name,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: theme.textStyle.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.o,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
