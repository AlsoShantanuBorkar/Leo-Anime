class MostPopular {
  String? id;
  int? malId;
  Title? title;
  String? image;
  Trailer? trailer;
  String? description;
  String? cover;
  int? rating;
  String? releasedDate;
  int? totalEpisodes;
  List<String>? genres;
  int? duration;
  String? type;

  MostPopular({
    this.id,
    this.malId,
    this.title,
    this.image,
    this.trailer,
    this.description,
    this.cover,
    this.rating,
    this.releasedDate,
    this.totalEpisodes,
    this.genres,
    this.duration,
    this.type,
  });

  MostPopular.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    malId = json['malId'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    image = json['image'];
    trailer =
        json['trailer'] != null ? Trailer.fromJson(json['trailer']) : null;
    description = json['description'];
    cover = json['cover'];
    rating = json['rating'];
    releasedDate = json['releasedDate'];
    totalEpisodes = json['totalEpisodes'];
    genres = json['genres'].cast<String>();
    duration = json['duration'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['malId'] = malId;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['image'] = image;
    if (trailer != null) {
      data['trailer'] = trailer!.toJson();
    }
    data['description'] = description;
    data['cover'] = cover;
    data['rating'] = rating;
    data['releasedDate'] = releasedDate;
    data['totalEpisodes'] = totalEpisodes;
    data['genres'] = genres;
    data['duration'] = duration;
    data['type'] = type;
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

class Trailer {
  String? site;
  String? id;
  String? thumbnail;

  Trailer({this.site, this.id, this.thumbnail});

  Trailer.fromJson(Map<String, dynamic> json) {
    site = json['site'];
    id = json['id'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['site'] = site;
    data['id'] = id;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
