class SubCategoriesModel {
  String name;
  String category;
  String image;

  SubCategoriesModel({this.name = "", this.category = "", this.image = ""});

  factory SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    return SubCategoriesModel(
      name: json["name"].toString(),
      category: json["category"].toString(),
      image: json["image"].toString(),
    );
  }
}
