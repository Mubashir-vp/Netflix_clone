

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
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
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    final bool? adult;
    final dynamic backdropPath;
    final dynamic belongsToCollection;
    final int ?budget;
    final List<dynamic> ?genres;
    final String ? homepage;
    final int ?id;
    final dynamic imdbId;
    final String ?originalLanguage;
    final String ?originalTitle;
    final String ?overview;
    final int ?popularity;
    final dynamic posterPath;
    final List<dynamic> ?productionCompanies;
    final List<dynamic> ?productionCountries;
    final String ?releaseDate;
    final int ?revenue;
    final int ?runtime;
    final List<dynamic> ?spokenLanguages;
    final String ?status;
    final String ?tagline;
    final String ?title;
    final bool ?video;
    final int ?voteAverage;
    final int ?voteCount;

    factory User.fromJson(Map<String, dynamic> json) => User(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"],
        genres: List<dynamic>.from(json["genres"].map((x) => x)),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"],
        posterPath: json["poster_path"],
        productionCompanies: List<dynamic>.from(json["production_companies"].map((x) => x)),
        productionCountries: List<dynamic>.from(json["production_countries"].map((x) => x)),
        releaseDate: json["release_date"],
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<dynamic>.from(json["spoken_languages"].map((x) => x)),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"],
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": List<dynamic>.from(genres!.map((x) => x)),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(productionCompanies!.map((x) => x)),
        "production_countries": List<dynamic>.from(productionCountries!.map((x) => x)),
        "release_date": releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from(spokenLanguages!.map((x) => x)),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
