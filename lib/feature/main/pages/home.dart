import 'package:app/common/export/helper.dart';
import 'package:app/features/main/widgets/adv_banner.dart';
import 'package:app/features/main/widgets/appbar.dart';
import 'package:app/features/main/widgets/main_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppbar(),
        Expanded(
          child: ListView(
            children: [
              AdvBanner(),
              MainCategory(),
            ],
          ),
        ),
      ],
    );
  }
}
