class ContactUsModel {
  String phone;
  String telegram;
  String instagram;

  ContactUsModel({this.phone = '', this.telegram = '', this.instagram = ''});

  factory ContactUsModel.fromJson(Map<String, dynamic> json) => ContactUsModel(
        phone: json["phone"].toString(),
        telegram: json["telegram"].toString(),
        instagram: json["instagram"].toString(),
      );
}
