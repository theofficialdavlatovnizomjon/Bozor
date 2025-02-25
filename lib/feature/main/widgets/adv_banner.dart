import 'package:app/common/export/helper.dart';
import 'package:app/features/main/manager/providers/home_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdvBanner extends StatelessWidget {
  const AdvBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final notifier = ref.watch(homeProvider);

        if (notifier.allBannerData.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: SizedBox(
            height: 180.o,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: notifier.allBannerData.length,
              options: CarouselOptions(
                height: 180.o,
                viewportFraction: 1,
                autoPlayInterval: Duration(seconds: 20),
                autoPlayCurve: Curves.decelerate,
                enlargeCenterPage: true,
                animateToClosest: true,
                autoPlay: false,
              ),
              itemBuilder: (context, itemIndex, pageViewIndex) {
                final data = notifier.allBannerData[itemIndex];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.o),
                    child: CachedNetworkImage(
                      height: 180.o,
                      width: double.infinity,
                      imageUrl: data.image,
                      fit: BoxFit.cover,
                      errorWidget: (context, image, object) {
                        return Icon(
                          Icons.error,
                          color: theme.dark,
                          size: 32.o,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
