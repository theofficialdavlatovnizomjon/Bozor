import 'package:app/common/network/links.dart';
import 'package:app/core/api/client.dart';
import 'package:app/features/profile/manager/models/faq_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final faqProvider = ChangeNotifierProvider<FaqNotifier>((ref) {
  return faqNotifier;
});

FaqNotifier? _faqNotifier;

FaqNotifier get faqNotifier {
  _faqNotifier ??= FaqNotifier();
  return _faqNotifier!;
}

class FaqNotifier with ChangeNotifier {
  FaqNotifier() {
    getFaqData();
  }

  bool isFaqLoading = false;
  List<FaqModel> faqData = [];

  Future<void> getFaqData() async {
    if (isFaqLoading) return;

    isFaqLoading = true;
    notifyListeners();

    try {
      final response = await client.get(Links.faq);
      if (response.status == 200) {
        faqData = (response.data as List)
            .map((e) => FaqModel.fromJson(e))
            .toList();
      } else {
        debugPrint('Error get categories data: ${response.status}');
      }
    } catch (e) {
      debugPrint('Exception during get categories data: $e');
    } finally {
      isFaqLoading = false;
      notifyListeners();
    }
  }
}
