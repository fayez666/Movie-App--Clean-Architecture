import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app/core/base_usecase/base_usecase.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/recommandation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommandationUseCase
    extends BaseUseCase<List<Recommendation>, RecommandationParms> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommandationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommandationParms parms) async {
    return await baseMovieRepository.getMovieRecomendation(parms);
  }
}

class RecommandationParms extends Equatable {
  final int id;

  const RecommandationParms({required this.id});

  @override
  List<Object> get props => [id];
}
