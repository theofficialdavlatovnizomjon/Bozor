import 'package:app/common/network/links.dart';
import 'package:app/core/api/client.dart';
import 'package:app/features/profile/manager/models/contact_us_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider = ChangeNotifierProvider<ProfileNotifier>((ref) {
  return profileNotifier;
});

ProfileNotifier? _profileNotifier;

ProfileNotifier get profileNotifier {
  _profileNotifier ??= ProfileNotifier();
  return _profileNotifier!;
}

class ProfileNotifier with ChangeNotifier {
  ContactUsModel? contactUsData;

  Future<void> getUserData() async {
    final response = await client.get("${Links.user}/5");
    if (response.status == 200) {
      // contactUsData = ContactUsModel.fromJson(response.data);
    }
  }

  Future<void> getContactUsData() async {
    final response = await client.get(Links.contact);
    if (response.status == 200) {
      contactUsData = ContactUsModel.fromJson(response.data);
    }
  }
}
