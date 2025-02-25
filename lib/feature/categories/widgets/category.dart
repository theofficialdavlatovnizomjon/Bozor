import 'package:app/common/export/helper.dart';
import 'package:app/features/categories/manager/providers/categories_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final notifier = ref.watch(categoriesProvider);
        return Container(
          width: 90.o,
          color: theme.white,
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) => SizedBox(height: 12.0),
            itemCount: notifier.categoriesData.length,
            itemBuilder: (context, index) {
              final data = notifier.categoriesData[index];
              return InkWell(
                onTap: () => notifier.onNewSubCategories(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CachedNetworkImage(
                        width: 90.o,
                        height: 70.o,
                        imageUrl: data.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      data.name,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: theme.textStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: notifier.currentIndex ==
                                notifier.categoriesData[index].id
                            ? theme.green
                            : theme.dark,
                        fontSize: 14.o,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
