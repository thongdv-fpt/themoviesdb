class Detailperson {
  bool? adult;
  List<Null>? alsoKnownAs;
  String? biography;
  String? birthday;
  Null? deathday;
  int? gender;
  String? homepage;
  int? id;
  String? imdbId;
  String? knownForDepartment;
  String? name;
  String? placeOfBirth;
  double? popularity;
  String? profilePath;
  Credits? credits;

  Detailperson(
      { adult,
       alsoKnownAs,
       biography,
       birthday,
       deathday,
       gender,
       homepage,
       id,
       imdbId,
       knownForDepartment,
       name,
       placeOfBirth,
       popularity,
       profilePath,
       credits});

  Detailperson.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    if (json['also_known_as'] != null) {
      alsoKnownAs = <Null>[];
      json['also_known_as'].forEach((v) {
        // alsoKnownAs!.add( Null.fromJson(v));
      });
    }
    biography = json['biography'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    gender = json['gender'];
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    credits =
        json['credits'] != null ? Credits.fromJson(json['credits']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    if (alsoKnownAs != null) {
      // data['also_known_as'] =  alsoKnownAs!.map((v) => v.toJson()).toList();
    }
    data['biography'] = biography;
    data['birthday'] = birthday;
    data['deathday'] = deathday;
    data['gender'] = gender;
    data['homepage'] = homepage;
    data['id'] = id;
    data['imdb_id'] = imdbId;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['place_of_birth'] = placeOfBirth;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    if (credits != null) {
      data['credits'] = credits!.toJson();
    }
    return data;
  }
}

class Credits {
  List<Cast>? cast;
  List<Null>? crew;

  Credits({ cast,  crew});

  Credits.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <Null>[];
      json['crew'].forEach((v) {
        // crew!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cast != null) {
      data['cast'] =  cast!.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      // data['crew'] =  crew!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cast {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? posterPath;
  int? voteCount;
  bool? video;
  double? voteAverage;
  String? title;
  String? overview;
  String? releaseDate;
  double? popularity;
  String? character;
  String? creditId;
  int? order;

  Cast(
      { adult,
       backdropPath,
       genreIds,
       id,
       originalLanguage,
       originalTitle,
       posterPath,
       voteCount,
       video,
       voteAverage,
       title,
       overview,
       releaseDate,
       popularity,
       character,
       creditId,
       order});

  Cast.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    voteCount = json['vote_count'];
    video = json['video'];
    voteAverage = json['vote_average'];
    title = json['title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    popularity = json['popularity'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] =  originalLanguage;
    data['original_title'] =  originalTitle;
    data['poster_path'] =  posterPath;
    data['vote_count'] =  voteCount;
    data['video'] =  video;
    data['vote_average'] =  voteAverage;
    data['title'] =  title;
    data['overview'] =  overview;
    data['release_date'] =  releaseDate;
    data['popularity'] =  popularity;
    data['character'] =  character;
    data['credit_id'] =  creditId;
    data['order'] =  order;
    return data;
  }
}