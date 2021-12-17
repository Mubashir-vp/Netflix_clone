import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



class HttpService{
 late Dio _dio;

  final baseUrl = "https://api.themoviedb.org/3/movie/8?api_key=3e801f599186241c08d9adfa803d6fd0&language=en-US";

  HttpService(){
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));

    initializeInterceptors();
  }


  Future<Response> getRequest(String endPoint) async{
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;

  }


  initializeInterceptors(){
    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError error,ErrorInterceptorHandler errorInterceptorHandler){
        print(error.message);
      },
      onRequest: (RequestOptions request,RequestInterceptorHandler requestInterceptorHandler){
        print("${request.method} ${request.path}");
      },
      onResponse: (Response response,ResponseInterceptorHandler responseInterceptorHandler){
        print(response.data);
      }
    ));
  }
}