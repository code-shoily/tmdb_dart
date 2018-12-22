class Genre {
  int id;
  String name;

  Genre(this.id, this.name);

  Genre.fromJSON(Map<String, dynamic> data) {
    this.id = data["id"];
    this.name = data["name"];
  }
}

class SpokenLanguage {
  String ISO_639_1; // this is named so because this is a specification code;
  String name;

  SpokenLanguage({this.name, this.ISO_639_1});

  SpokenLanguage.fromJSON(Map<String, dynamic> data) {
    this.ISO_639_1 = data["iso_639_1"];
    this.name = data["name"];
  }
}

class ProductionCountry {
  String ISO_3166_1;
  String name;

  ProductionCountry({this.name, this.ISO_3166_1});

  ProductionCountry.fromJSON(Map<String, dynamic> data) {
    this.ISO_3166_1 = data["iso_3166_1"];
    this.name = data["name"];
  }
}

class ProductionCompany {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompany({this.id, this.name, this.logoPath, this.originCountry});

  ProductionCompany.fromJSON(Map<String, dynamic> data) {
    this.id = data["id"];
    this.name = data["name"];
    this.logoPath = data["logo_path"];
    this.originCountry = data["origin_country"];
  }
}

class Movie {
  // Reference: https://developers.themoviedb.org/3/movies/get-latest-movie
  int id;
  String imdbID;
  bool isAdult;
  String backdropPath;
  dynamic belongsToCollection; // TODO: Have to be sure about this.
  int budget;
  List<Genre> genres;
  String homePage;
  String originalLanguage;
  String originalTitle;
  String overview;
  num popularity; // can be decimal.
  String posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  String releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool hasVideo;
  num voteAverage;
  int voteCount;

  Movie(
      {this.id,
      this.imdbID,
      this.isAdult,
      this.backdropPath,
      this.belongsToCollection,
      this.budget,
      this.genres,
      this.homePage,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.hasVideo,
      this.voteAverage,
      this.voteCount});

  Movie.fromJSON(Map<String, dynamic> data) {
    this.id = data["id"];
    this.imdbID = data["imdb_id"];
    this.isAdult = data["adult"];
    this.backdropPath = data["backdrop_path"];
    this.belongsToCollection = data["belongs_to_collection"];
    this.budget = data["budget"];
    this.genres = data["genres"].map((gn) => new Genre.fromJSON(gn));
    this.homePage = data["homepage"];
    this.originalLanguage = data["original_language"];
    this.originalTitle = data["original_title"];
    this.overview = data["overview"];
    this.popularity = data["popularity"];
    this.posterPath = data["poster_path"];
    this.productionCompanies = data["production_companies"]
        .map((pc) => new ProductionCompany.fromJSON(pc));
    this.productionCountries = data["production_countries"]
        .map((pc) => new ProductionCountry.fromJSON(pc));
    this.releaseDate = data["release_date"];
    this.revenue = data["revenue"];
    this.runtime = data["runtime"];
    this.spokenLanguages =
        data["spoken_languages"].map((sp) => new SpokenLanguage.fromJSON(sp));
    this.status = data["status"];
    this.tagline = data["tagline"];
    this.title = data["title"];
    this.hasVideo = data["video"];
    this.voteAverage = data["vote_average"];
    this.voteCount = data["voteCount"];
  }
}
