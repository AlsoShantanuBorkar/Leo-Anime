class SearchData {
  String? id;
  Title? title;
  String? image;
  String? rating;
  String? releaseDate;

  SearchData({this.id, this.title, this.image, this.rating, this.releaseDate});

  SearchData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ?  Title.fromJson(json['title']) : null;
    image = json['image'];
    rating = json['rating'];
    releaseDate = json['releaseDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['image'] = image;
    data['rating'] = rating;
    data['releaseDate'] = releaseDate;
    return data;
  }
}

class Title {
  String? romaji;
  String? english;
  String? native;
  String? userPreferred;

  Title({this.romaji, this.english, this.native, this.userPreferred});

  Title.fromJson(Map<String, dynamic> json) {
    romaji = json['romaji'];
    english = json['english'];
    native = json['native'];
    userPreferred = json['userPreferred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['romaji'] = romaji;
    data['english'] = english;
    data['native'] = native;
    data['userPreferred'] = userPreferred;
    return data;
  }
}
