// Account models.

class Gravatar {
  String hash;

  Gravatar({this.hash});

  Gravatar.fromJSON(Map<String, dynamic> data) {
    this.hash = data['hash'];
  }
}

class Avatar {
  Gravatar gravatar;

  Avatar({this.gravatar});

  Avatar.fromJSON(Map<String, dynamic> data) {
    this.gravatar = new Gravatar.fromJSON(data['gravatar']);
  }
}

class AccountDetail {
  // Account Details
  //
  // https://developers.themoviedb.org/3/account/get-account-details
  Avatar avatar;
  int id;
  String ISO_639_1;
  String ISO_3166_1;
  String name;
  bool includeAdult;
  String username;

  AccountDetail(
      {this.avatar,
      this.id,
      this.ISO_639_1,
      this.ISO_3166_1,
      this.name,
      this.includeAdult,
      this.username});

  AccountDetail.fromJSON(Map<String, dynamic> data) {
    this.avatar = new Avatar.fromJSON(data['avatar']);
    this.id = data['id'];
    this.ISO_639_1 = data['iso_639_1'];
    this.ISO_3166_1 = data['iso_3166_1'];
    this.name = data['name'];
    this.includeAdult = data['include_adult'];
    this.username = data['username'];
  }
}

class MovieList {
  String description;
  int favoriteCount;
  int id;
  int itemCount;
  String ISO_639_1;
  String listType;
  String name;
  String posterPath;

  MovieList(
      {this.description,
      this.favoriteCount,
      this.id,
      this.itemCount,
      this.ISO_639_1,
      this.listType,
      this.name,
      this.posterPath});

  MovieList.fromJSON(Map<String, dynamic> data) {
    this.description = data['description'];
    this.favoriteCount = data['favoriteCount'];
    this.id = data['id'];
    this.itemCount = data['item_count'];
    this.ISO_639_1 = data['iso_639_1'];
    this.listType = data['list_type'];
    this.name = data['name'];
    this.posterPath = data['poster_path'];
  }
}

abstract class Page {
  int page;
  int totalPages;
  int totalResults;

  Page(this.page, this.totalPages, this.totalResults);
}

class MovieListResponse extends Page {
  List<MovieList> results;

  MovieListResponse({int page, this.results, int totalPages, int totalResults})
      : super(page, totalPages, totalResults);

  MovieListResponse.fromJSON(Map<String, dynamic> data)
      : super(data['page'], data['total_pages'], data['total_results']) {
    this.results = List<MovieList>.of(
        data['results'].map((item) => new MovieList.fromJSON(item)));
  }
}

class FavoriteMovies extends Page {
  List<Movie> results;

  FavoriteMovies({int page, this.results, int totalPages, int totalResults})
      : super(page, totalPages, totalResults);

  FavoriteMovies.fromJSON(Map<String, dynamic> data)
      : super(data['page'], data['total_pages'], data['total_results']) {
    this.results =
        List<Movie>.of(data['results'].map((item) => new Movie.fromJSON(item)));
  }
}

class Genre {
  int id;
  String name;

  Genre({this.id, this.name});

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

class Keyword {
  int id;
  String name;

  Keyword({this.id, this.name});

  Keyword.fromJSON(Map<String, dynamic> data) {
    this.id = data['id'];
    this.name = data['name'];
  }
}

class Network {
  String headquarters;
  String homepage;
  int id;
  String name;
  String originCountry;

  Network(
      {this.headquarters,
      this.homepage,
      this.id,
      this.name,
      this.originCountry});

  Network.fromJSON(Map<String, dynamic> data) {
    this.headquarters = data['headquarters'];
    this.homepage = data['homepage'];
    this.id = data['id'];
    this.name = data['name'];
    this.originCountry = data['origin_country'];
  }
}

class NetworkAlternativeName {
  String name;
  String type;

  NetworkAlternativeName({this.name, this.type});

  NetworkAlternativeName.fromJSON(Map<String, dynamic> data) {
    this.name = data['name'];
    this.type = data['type'];
  }
}

class NetworkAlternativeNames {
  int id;
  List<NetworkAlternativeName> results;

  NetworkAlternativeNames({this.id, this.results});

  NetworkAlternativeNames.fromJSON(Map<String, dynamic> data) {
    this.id = data['id'];
    this.results = List<NetworkAlternativeName>.of(
        data['results'].map((val) => NetworkAlternativeName.fromJSON(val)));
  }
}

abstract class Image {
  num aspectRatio;
  String filePath;
  int height;
  num voteAverage;
  num voteCount;
  int width;

  Image(this.aspectRatio, this.filePath, this.height, this.voteAverage,
      this.voteCount, this.width);
}

class Logo extends Image {
  String fileType;

  Logo(
      {num aspectRatio,
      String filePath,
      int height,
      num voteAverage,
      num voteCount,
      num width,
      this.fileType})
      : super(aspectRatio, filePath, height, voteAverage, voteCount, width);

  Logo.fromJSON(Map<String, dynamic> data)
      : super(data['aspect_ratio'], data['file_path'], data['height'],
            data['vote_average'], data['vote_count'], data['width']) {
    this.fileType = data['file_type'];
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
