class CategoriesModel {
  int id;
  String name;
  String image;

  CategoriesModel({this.id = 0, this.name = "", this.image = ""});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: int.parse(json["id"].toString()),
      name: json["name"].toString(),
      image: json["image"].toString(),
    );
  }
}
