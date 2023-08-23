class People {
  String name;
  String avatarURL;

  People(this.name, this.avatarURL);
}

class Actor extends People {
  Actor({required Map<String, dynamic> map})
      : super(map["name"], map["avatarURL"]);
}

class Director extends People {
  Director({required Map<String, dynamic> map})
      : super(map["name"], map["avatarURL"]);
}

int _rankNum = 1;

class MovieItem {
  late int rank;
  String? imageURL;
  String? title;
  String? playDate;
  double? rating;
  List<String>? genres;
  List<Actor>? casts;
  Director? director;
  String? originalTitle;

  MovieItem.fromMap(Map<String, dynamic> json) {
    rank = _rankNum++;
    imageURL = json["images"]["medium"];
    title = json["title"];
    playDate = json["year"];
    rating = json["rating"]["average"];
    genres = json["genres"].cast<String>();
    casts = (json["casts"] as List<dynamic>).map((e) => Actor(map: e)).toList();
    originalTitle = json["original_title"];
    if ((json["directors"] as List).length > 0) {
      director = Director(map: json["directors"][0]);
    }
  }

  @override
  String toString() {
    return 'MovieItem{rank: $rank, imageURL: $imageURL, title: $title, playDate: $playDate, rating: $rating, genres: $genres, casts: $casts, director: $director, originalTitle: $originalTitle}';
  }
}
