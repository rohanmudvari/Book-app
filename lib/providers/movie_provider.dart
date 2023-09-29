import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods/service/movie_service.dart';

final moviePopular= FutureProvider((ref) => MovieService.getPopularMovieData());