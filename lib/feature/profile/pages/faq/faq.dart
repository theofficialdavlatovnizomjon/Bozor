import 'package:app/common/export/assistant.dart';
import 'package:app/common/export/helper.dart';
import 'package:app/components/back_appbar.dart';
import 'package:app/features/profile/manager/providers/faq_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: theme.appbar,
      backgroundColor: theme.gray,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          BackAppbar(onTap: () => pop(context), title: "Malumot"),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final notifier = ref.watch(faqProvider);

                if (notifier.isFaqLoading) return Loading.main();

                if (notifier.faqData.isEmpty) return const SizedBox.shrink();

                return ListView.separated(
                  itemCount: notifier.faqData.length,
                  padding: EdgeInsets.all(16.0),
                  separatorBuilder: (context, index) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    return ExpansionTile(
                      title: Text(
                        maxLines: 2,
                        notifier.faqData[index].question,
                        style: theme.textStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontFamily: theme.fontDudka,
                          fontSize: 16.o,
                        ),
                      ),
                      expandedAlignment: Alignment.centerLeft,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      backgroundColor: theme.white,
                      collapsedBackgroundColor: theme.white,
                      childrenPadding: EdgeInsets.only(
                          left: 16.o, right: 16.o, bottom: 10.o),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.o)),
                      ),
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.o)),
                      ),
                      children: [
                        Text(
                          notifier.faqData[index].answer,
                          textAlign: TextAlign.left,
                          style: theme.textStyle.copyWith(
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.o,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
