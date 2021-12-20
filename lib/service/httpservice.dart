// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:netflix_clone/constant_datas/constant.dart';
import 'package:netflix_clone/model/popularmovies.dart';
import 'package:netflix_clone/model/toprated_movies.dart';
import 'package:netflix_clone/model/upcoming.dart';

import '../model/users.dart';

class HttpService {
  Users? user;
  PopularMovie? pop;
  Upcoming? up;
  Welcome? toprated;

  static Constant obj = Constant();
  late Dio _dio;
  final baseUrl = obj.baseurl;
  final popular = obj.popular;
  final upcoming = obj.upcoming;
  final toplink = obj.upcoming;

  HttpService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }

  Future<Users?> getRequest() async {
    Response response;

    try {
      response = await _dio.get(baseUrl);
      user = Users.fromJson(response.data);
      print(user!.results!.length);
    } on DioError catch (e) {
      print(e.message);
      // throw Exception(e.message);
      return user;
    }
    response = await _dio.get(baseUrl);
    return user;
  }

  Future<PopularMovie?> popularMovie() async {
    Response response;

    try {
      response = await _dio.get(popular);
      pop = PopularMovie.fromJson(response.data);
      print(pop!.results!.length);
    } on DioError catch (e) {
      print(e.message);
      // throw Exception(e.message);
      return pop;
    }
    response = await _dio.get(popular);
    return pop;
  }

  Future<Upcoming?> upComing() async {
    Response response;

    try {
      response = await _dio.get(upcoming);
      up = Upcoming.fromJson(response.data);
      print(up!.results!.length);
    } on DioError catch (e) {
      print(e.message);
      // throw Exception(e.message);
      return up;
    }
    response = await _dio.get(upcoming);
    return up;
  }

  Future<Welcome?> topRated() async {
    Response response;

    try {
      response = await _dio.get(toplink);
      toprated = Welcome.fromJson(response.data);
      print(toprated!.results!.length);
    } on DioError catch (e) {
      print(e.message);
      // throw Exception(e.message);
      return toprated;
    }
    response = await _dio.get(toplink);
    return toprated;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onError:
          (DioError error, ErrorInterceptorHandler errorInterceptorHandler) {
        print("errrrrrr${error.message}");
      },
    ));
  }
}
