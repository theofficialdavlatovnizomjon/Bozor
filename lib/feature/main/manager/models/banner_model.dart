class BannerModel {
  String slug;
  String type;
  String image;

  BannerModel({this.image = '', this.slug = '', this.type = ''});

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
      image: json["image"].toString(),
      slug: json["slug"].toString(),
      type: json["type"].toString());
}

// class BannerModel {
//   int id;
//   String name;
//   List<dynamic>? image;
//   String price;
//   String discountPrice;
//   String description;
//   String category;
//   String supCategory;
//   String amount;
//   String unitOfMeasurement;
//
//   BannerModel({
//     this.id = 0,
//     this.name = "",
//     this.image,
//     this.price = "",
//     this.discountPrice = "",
//     this.description = "",
//     this.category = "",
//     this.supCategory = "",
//     this.amount = "",
//     this.unitOfMeasurement = "",
//   });
//
//   factory BannerModel.fromJson(Map<String, dynamic> json) {
//     return BannerModel(
//       id: int.parse(json["id"].toString()),
//       name: json["name"].toString(),
//       image: json["image"] ?? [],
//       price: json["price"].toString(),
//       discountPrice: json["discount_price"].toString(),
//       description: json["description"].toString(),
//       category: json["category"].toString(),
//       supCategory: json["sup-category"].toString(),
//       amount: json["miqdori"].toString(),
//       unitOfMeasurement: json["o'lchov birligi"].toString(),
//     );
//   }
// }
