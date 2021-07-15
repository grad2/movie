import 'package:untitled/domain/entity/production_companies.dart';
import 'package:untitled/domain/entity/production_countries.dart';
import 'package:untitled/domain/entity/spoken_languages.dart';

import 'genres.dart';

class DetailsMovie {
  bool? adult;
  String backdropPath;
  String? belongsToCollection;
  int? budget;
  String genres;
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
        backdropPath = _getImage(json),
        belongsToCollection = null,
        budget = json['budget'],
        genres = _genres(json),
        homepage = json['homepage'],
        id = json['id'],
        imdbId = json['imdb_id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        productionCompanies = _productionCompaniesList(json),
        productionCountries = _productionCountriesList(json),
        releaseDate = json['release_date'],
        revenue = json['revenue'],
        runtime = json['runtime'],
        spokenLanguages = _spokenLanguagesList(json),
        status = json['status'],
        tagline = json['tagline'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'];

  static _genres(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      String _genres = '';
      json['genres'].forEach((v) {
        if (_genres == '') {
          _genres = Genres.fromJson(v).name;
        } else {
          _genres = '$_genres  /  ${Genres.fromJson(v).name}';
        }
      });
      return _genres;
    }
  }

  static _productionCountriesList(Map<String, dynamic> json) {
    if (json['production_countries'] != null) {
      List productionCountries = <ProductionCountries>[];
      json['production_countries'].forEach((v) {
        productionCountries.add(ProductionCountries.fromJson(v));
      });
      return productionCountries;
    }
  }
  static _productionCompaniesList(Map<String, dynamic> json) {
    if (json['production_companies'] != null) {
      List productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies.add(ProductionCompanies.fromJson(v));
      });
      return productionCompanies;
    }
  }
  static _spokenLanguagesList(Map<String, dynamic> json) {
    if (json['spoken_languages'] != null) {
      List spokenLanguages = <SpokenLanguages>[];
      json['spoken_languages'].forEach((v) {
        spokenLanguages.add(SpokenLanguages.fromJson(v));
      });
      return spokenLanguages;
    }
  }
  static _getImage(Map<String, dynamic> json) {
    if (json['backdrop_path'].toString() == 'null') {
      return 'https://serial-go.org/uploads/no_poster.jpg';
    } else {
      return 'https://www.themoviedb.org/t/p/w220_and_h330_face' +
          json['backdrop_path'].toString();
    }
  }
}

