
class People{
  String name;
  String avatarURL;

  People(this.name, this.avatarURL);
}

class Actor extends People{
  Actor({required Map<String,dynamic> map}): super(map["name"],map["avatarURL"]);
}

class Director extends People{
  Director({required Map<String,dynamic> map}): super(map["name"],map["avatarURL"]);
}


int _rankNum = 0;
class MovieItem{
  int rank;
  String imageURL;
  String title;
  String playDate;
  double rating;
  List<String> genres;
  List<Actor> casts;
  Director? director;
  String originalTitle;

  MovieItem.fromMap(Map<String,dynamic> json):
    this.rank = _rankNum ++,
    this.imageURL = json["images"]["medium"],
    this.title = json["title"],
    this.playDate = json["year"],
    this.rating = json["rating"]["average"],
    this.genres = json["genres"].cast<String>(),
    this.casts = (json["casts"] as List<dynamic>).map((e) => Actor(map:e)).toList(),
    this.originalTitle = json["original_title"]{
    if ((json["directors"] as List).length > 0){
      this.director = Director(map: json["directors"][0]);
    }
  }
}
