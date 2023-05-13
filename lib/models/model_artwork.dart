class ModelArtWork {
  late String title = "";
  late String subTitle = "";
  late String detail = "";
  late String imagePath = "";

  ModelArtWork(this.title, this.subTitle, this.detail, this.imagePath);

  // named constructor
  ModelArtWork.fromJson(Map<String, dynamic> json)
      : title = json['title'].toString(),
        subTitle = json['subTitle'].toString(),
        detail = json['detail'].toString(),
        imagePath = json['imagePath'].toString();
  // method
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subTitle': subTitle,
      'detail': detail,
      'imagePath': imagePath
    };
  }
}
