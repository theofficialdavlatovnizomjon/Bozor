import 'package:app/common/export/assistant.dart';
import 'package:app/common/export/helper.dart';
import 'package:app/features/categories/manager/providers/categories_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Subcategory extends StatelessWidget {
  const Subcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final notifier = ref.watch(categoriesProvider);
          if (notifier.isSubCategoryLoading) return Loading.main();
          return GridView.builder(
            // shrinkWrap: true,
            itemCount: notifier.subCategoryData.length,
            padding: EdgeInsets.all(16.o),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 230.o,
              mainAxisSpacing: 12.o,
              crossAxisSpacing: 12.o,
              childAspectRatio: 1,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final data = notifier.subCategoryData[index];
              return GestureDetector(
                onTap: () {
                  /// TODO: Bu yerda push qilip ketaman!
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: theme.borderColor,
                      width: 1.o,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        height: 110.o,
                        width: double.infinity,
                        imageUrl: data.image,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 4.o),
                      Text(
                        data.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: theme.textStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.o,
                        ),
                      ),
                      Text(
                        "AED 5.95",
                        textAlign: TextAlign.center,
                        style: theme.textStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: theme.green,
                          fontSize: 15.o,
                        ),
                      ),
                      Text(
                        "1 pack",
                        textAlign: TextAlign.center,
                        style: theme.textStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.o,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: 32.o,
                        width: double.infinity,
                        color: theme.green,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
