import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParms> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailsUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParms parms) async {
    return await baseMovieRepository.getMovieDetail(parms);
  }
}

class MovieDetailsParms extends Equatable {
  final int movieId;

  const MovieDetailsParms({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
