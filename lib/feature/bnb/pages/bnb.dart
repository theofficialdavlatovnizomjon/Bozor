import 'package:app/common/export/helper.dart';
import 'package:app/common/utils/immutable_data.dart';
import 'package:app/features/bnb/manager/providers/bnb_provider.dart';
import 'package:app/features/categories/pages/categories.dart';
import 'package:app/features/profile/pages/profile.dart';
import 'package:app/features/search/pages/search.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/features/bnb/widgets/bnb_item.dart';
import 'package:app/features/main/pages/home.dart';
import 'package:flutter/material.dart';

class BnbPage extends StatefulWidget {
  const BnbPage({super.key});

  @override
  State<BnbPage> createState() => _BnbPageState();
}

class _BnbPageState extends State<BnbPage> {
  List<Widget> screen = [
    HomePage(),
    Search(),
    Categories(),
    SizedBox(),
    Profile(),
  ];

  Widget get bottomNavigationBar {
    return Container(
      height: 60.o,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: theme.white),
      child: Consumer(builder: (context, ref, child) {
        final notifier = ref.watch(bnbProvider);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(bnbData.length, (index) {
            final data = bnbData[index];
            final isFocus = notifier.isFocus(index);
            return BnbItem(
              onTap: () => notifier.onTap(index),
              isFocus: isFocus,
              data: data,
            );
          }),
        );
      }),
    );
  }

  Widget get body {
    return Consumer(builder: (context, ref, child) {
      final index = ref.watch(bnbProvider).currentIndex;
      return screen[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: theme.appbar,
        backgroundColor: theme.gray,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: bottomNavigationBar,
        body: body);
  }
}
