// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

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
      print(response.data);
    } on SocketException {
      print('Network error');
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
      print(pop!.results);
    } on SocketException {
      print('Network error');
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
    } on SocketException {
      print('Network error');
    } on DioError catch (e) {
      print(e.message);
      // throw Exception(e.message);
      return up;
    }
    response = await _dio.get(upcoming);
    return up;
  }

  Future<PopularMovie?> topRated({required String txt}) async {
    Response response;

    try {
      response = await _dio.get(
          "https://api.themoviedb.org/3/search/movie?api_key=3e801f599186241c08d9adfa803d6fd0&language=en-US&query=${txt}&page=1&include_adult=false");
      toprated = Welcome.fromJson(response.data);
      print(pop!.results!.length);
    } on SocketException {
      print('Network error');
    } on DioError catch (e) {
      print(e.message);
      // throw Exception(e.message);
      return pop;
    }
    response = await _dio.get(
        "https://api.themoviedb.org/3/search/movie?api_key=3e801f599186241c08d9adfa803d6fd0&language=en-US&query=${txt}&page=1&include_adult=false");
    return pop;
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
