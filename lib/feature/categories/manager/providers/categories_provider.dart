import 'package:app/common/network/links.dart';
import 'package:app/core/api/client.dart';
import 'package:app/features/categories/manager/models/subcategory_model.dart';
import 'package:app/features/main/manager/models/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider = ChangeNotifierProvider<CategoriesNotifier>((ref) {
  return categoriesNotifier;
});

CategoriesNotifier? _categoriesNotifier;

CategoriesNotifier get categoriesNotifier {
  _categoriesNotifier ??= CategoriesNotifier();
  return _categoriesNotifier!;
}

class CategoriesNotifier with ChangeNotifier {
  CategoriesNotifier() {
    getAllCategoriesData().then((value) {
      getSubCategoriesData();
    });
  }

  int currentIndex = 0;

  bool isCategoriesLoading = false;
  List<CategoriesModel> categoriesData = [];
  bool isSubCategoryLoading = false;
  List<SubCategoriesModel> subCategoryData = [];

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
        currentIndex = categoriesData.first.id;
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

  void onNewSubCategories(int index) {
    currentIndex = categoriesData[index].id;
    notifyListeners();
    getSubCategoriesData();
  }

  Future<void> getSubCategoriesData() async {
    if (isSubCategoryLoading) return;

    isSubCategoryLoading = true;
    notifyListeners();

    try {
      final response = await client.post("${Links.categories}/$currentIndex");
      if (response.status == 200) {
        subCategoryData = (response.data['sup-categories'] as List)
            .map((e) => SubCategoriesModel.fromJson(e))
            .toList();
      } else {
        debugPrint('Error get categories data: ${response.status}');
      }
    } catch (e) {
      debugPrint('Exception during get categories data: $e');
    } finally {
      isSubCategoryLoading = false;
      notifyListeners();
    }
  }
}
