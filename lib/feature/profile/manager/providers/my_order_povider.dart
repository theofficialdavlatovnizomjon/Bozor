import 'package:app/common/network/links.dart';
import 'package:app/core/api/client.dart';
import 'package:app/features/profile/manager/models/contact_us_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final myOrderProvider = ChangeNotifierProvider<MyOrderNotifier>((ref) {
  return myOrderNotifier;
});

MyOrderNotifier? _myOrderNotifier;

MyOrderNotifier get myOrderNotifier {
  _myOrderNotifier ??= MyOrderNotifier();
  return _myOrderNotifier!;
}

class MyOrderNotifier with ChangeNotifier {
  ContactUsModel? contactUsData;

  Future<void> getMyOrderData() async {
    final response = await client.get("${Links.myOrder}/5");
    if (response.status == 200) {
      contactUsData = ContactUsModel.fromJson(response.data);
    }
  }
}
