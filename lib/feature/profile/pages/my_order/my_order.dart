import 'package:app/common/export/helper.dart';
import 'package:app/components/back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theme.appbar,
      backgroundColor: theme.gray,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          BackAppbar(onTap: () => pop(context), title: "Buyurtmalar"),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                return SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
