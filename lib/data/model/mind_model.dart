class MindModel {
  String mind;
  String author;

  MindModel({required this.mind, required this.author});

  factory MindModel.fromJson(Map<String, dynamic> json) {
    return MindModel(
        mind: json["mind"] ?? "empty", author: json["author"] ?? "empty");
  }

  toJson() {
    return { "mind": mind, "author": author};
  }
}
