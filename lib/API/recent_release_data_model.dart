class RecentRelease {
  String? id;
  int? malId;
  Title? title;
  String? episodeId;
  String? episodeTitle;
  int? episodeNumber;
  String? image;
  int? rating;

  RecentRelease({
    this.id,
    this.malId,
    this.title,
    this.episodeId,
    this.episodeTitle,
    this.episodeNumber,
    this.image,
    this.rating,
  });

  RecentRelease.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    malId = json['malId'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    episodeId = json['episodeId'];
    episodeTitle = json['episodeTitle'];
    episodeNumber = json['episodeNumber'];
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['malId'] = malId;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['episodeId'] = episodeId;
    data['episodeTitle'] = episodeTitle;
    data['episodeNumber'] = episodeNumber;
    data['image'] = image;
    data['rating'] = rating;
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
