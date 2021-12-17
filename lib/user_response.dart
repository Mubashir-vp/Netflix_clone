import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class ListUserResponse {
  ListUserResponse();

  @JsonKey(name: "id")
  late int id;

  @JsonKey(name: "imdb_id")
  late int imdbid;

  @JsonKey(name: "original_language")
  late String originallanguage;

  @JsonKey(name: "original_title")
  late String originaltitle;


  @JsonKey(name: "overview")
  late String overview;
  @JsonKey(name: "popularity")
  late int popularity;
  @JsonKey(name: "poster_path")
  late String posterpath;

  @JsonKey(name: "production_companies")
  late List<User> users;

  factory ListUserResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListUserResponseToJson(this);
}
