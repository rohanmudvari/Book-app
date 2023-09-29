
import 'package:dio/dio.dart';

import 'package:riverpods/constant/common.dart';
import 'package:riverpods/models/movie.dart';





class MovieService {

  static final dio = Dio();

  static Future<List<Movie>> getPopularMovieData() async{
    try{
      final response = await dio.get(
          'https://api.themoviedb.org/3/movie/popular',
          options: Options(
              headers: credential
          )
      );

      return  (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();

    }on DioException catch (err){
      throw '${err.response}';
    }
  }



}