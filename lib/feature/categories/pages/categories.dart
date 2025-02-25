import 'package:app/common/export/helper.dart';
import 'package:app/features/categories/manager/providers/categories_provider.dart';
import 'package:app/features/categories/widgets/appbar.dart';
import 'package:app/features/categories/widgets/category.dart';
import 'package:app/features/categories/widgets/subcategory.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoriesAppbar(),
        Expanded(
          child: Consumer(
            builder: (context, ref, child) {
              final notifier = ref.watch(categoriesProvider);
              return Row(
                children: [
                  Category(),
                  Subcategory(),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
