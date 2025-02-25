import 'package:app/common/helpers/assets.dart';
import 'package:app/common/network/links.dart';
import 'package:app/core/api/client.dart';
import 'package:app/features/auth/manager/models/login_class.dart';
import 'package:app/features/auth/manager/service/auth_service.dart';
import 'package:app/features/main/manager/models/banner_model.dart';
import 'package:app/features/main/manager/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = ChangeNotifierProvider<HomeNotifier>((ref) {
  return homeNotifier;
});

HomeNotifier? _homeNotifier;

HomeNotifier get homeNotifier {
  _homeNotifier ??= HomeNotifier();
  return _homeNotifier!;
}

class HomeNotifier with ChangeNotifier {
  HomeNotifier() {
    getAllCategoriesData();
    getAllBannerData();
  }

  bool isCategoriesLoading = false;
  List<CategoriesModel> categoriesData = [];

  Future<void> getAllCategoriesData() async {
    if (isCategoriesLoading) return;

    isCategoriesLoading = true;
    notifyListeners();

    try {
      final response = await client.get(Links.categories);
      if (response.status == 200) {
        categoriesData = (response.data as List)
            .map((e) => CategoriesModel.fromJson(e))
            .toList();
      } else {
        debugPrint('Error get categories data: ${response.status}');
      }
    } catch (e) {
      debugPrint('Exception during get categories data: $e');
    } finally {
      isCategoriesLoading = false;
      notifyListeners();
    }
  }

  bool isAllBannerLoading = false;
  List<BannerModel> allBannerData = [];

  Future<void> getAllBannerData() async {
    if (isAllBannerLoading) return;

    isAllBannerLoading = true;
    notifyListeners();

    try {
      final response = await client.get(Links.banner);
      if (response.status == 200) {
        allBannerData = (response.data as List)
            .map((e) => BannerModel.fromJson(e))
            .toList();
      } else {
        debugPrint('Error get categories data: ${response.status}');
      }
    } catch (e) {
      debugPrint('Exception during get categories data: $e');
    } finally {
      isAllBannerLoading = false;
      notifyListeners();
    }
  }
}
