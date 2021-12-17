// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListUserResponse _$ListUserResponseFromJson(Map<String, dynamic> json) =>
    ListUserResponse()
      ..id = json['id'] as int
      ..imdbid = json['imdb_id'] as int
      ..originallanguage = json['original_language'] as String
      ..originaltitle = json['original_title'] as String
      ..overview = json['overview'] as String
      ..popularity = json['popularity'] as int
      ..posterpath = json['poster_path'] as String
      ..users = (json['production_companies'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ListUserResponseToJson(ListUserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imdb_id': instance.imdbid,
      'original_language': instance.originallanguage,
      'original_title': instance.originaltitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterpath,
      'production_companies': instance.users,
    };
