// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:netflix_clone/constant_datas/constant.dart';
import 'package:netflix_clone/model/popularmovies.dart';
import 'package:netflix_clone/model/toprated_movies.dart';
import 'package:netflix_clone/model/upcoming.dart';
import 'package:netflix_clone/screens/home_screens/search.dart';

import '../model/users.dart';

class HttpService {
  String searchkey({required String text}) {
    return "https://api.themoviedb.org/3/search/movie?api_key=3e801f599186241c08d9adfa803d6fd0&language=en-US&query=$text&page=1&include_adult=true";
  }

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
    } on SocketException {
      print("Network down");
    }on DioError catch (e) {
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
    }on SocketException {
      print("Network down");
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
    }on SocketException {
      print("Network down");
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
    } on SocketException {
      print("Network down");
    }on DioError catch (e) {
      print(e.message);
      // throw Exception(e.message);
      return toprated;
    }
    response = await _dio.get(toplink);
    return toprated;
  }

  Future<Welcome?> search({required String txt}) async {
    Response response;

    try {
      response = await _dio.get(searchkey(text: txt));
      toprated = Welcome.fromJson(response.data);
      print(toprated!.results!.length);
    } on SocketException {
      print("Network down");
    } on DioError catch (e) {
      print(e.message);
      // throw Exception(e.message);
      return toprated;
    }
    response = await _dio.get(searchkey(text: txt));
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
