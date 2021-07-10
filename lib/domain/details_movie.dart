class DetailsMovie {
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  DetailsMovie({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount
  });
  DetailsMovie.fromJson(Map<String, dynamic> json)
      :
        adult = json['adult'],
        backdropPath = json['backdrop_path'],
        belongsToCollection = null,
        budget = json['budget'],
        genres = genresList(json),
        homepage = json['homepage'],
        id = json['id'],
        imdbId = json['imdb_id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        productionCompanies = productionCompaniesList(json),
        productionCountries = productionCountriesList(json),
        releaseDate = json['release_date'],
        revenue = json['revenue'],
        runtime = json['runtime'],
        spokenLanguages = spokenLanguagesList(json),
        status = json['status'],
        tagline = json['tagline'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'];

  static genresList(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      List genres = <Genres>[];
      json['genres'].forEach((v) {
        genres.add(Genres.fromJson(v));
      });
      return genres;
    }
  }
  static productionCountriesList(Map<String, dynamic> json) {
    if (json['production_countries'] != null) {
      List productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries.add(ProductionCountries.fromJson(v));
      });
      return productionCountries;
    }
  }
  static productionCompaniesList(Map<String, dynamic> json) {
    if (json['production_companies'] != null) {
      List productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies.add(ProductionCompanies.fromJson(v));
      });
      return productionCompanies;
    }
  }
  static spokenLanguagesList(Map<String, dynamic> json) {
    if (json['spoken_languages'] != null) {
      List spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages.add(SpokenLanguages.fromJson(v));
      });
      return spokenLanguages;
    }
  }
}
class BelongsToCollection {}
class Genres {
  int id;
  String name;

  Genres({required this.id, required this.name});

  Genres.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        name = json['name'];

}

class ProductionCompanies {
  int id;
  String logoPath;
  String name;
  String originCountry;

  ProductionCompanies({required this.id, required this.logoPath, required this.name, required this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json)
      :
        id = json['id'],
        logoPath = json['logo_path'],
        name = json['name'],
        originCountry = json['origin_country'];

}

class ProductionCountries {
  String iso31661;
  String name;

  ProductionCountries({required this.iso31661, required this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json)
      :
        iso31661 = json['iso_3166_1'],
        name = json['name'];

}

class SpokenLanguages {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguages({required this.englishName, required this.iso6391, required this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json)
      :
        englishName = json['english_name'],
        iso6391 = json['iso_639_1'],
        name = json['name'];

}