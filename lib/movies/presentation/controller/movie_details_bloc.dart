import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_recommandation_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_state.dart';

part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommandationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendsEvent>(_getRecommendations);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommandationUseCase getRecommandationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParms(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetailsState: RequestState.loaded,
              movieDetail: r,
            )));
  }

  FutureOr<void> _getRecommendations(
      GetMovieRecommendsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommandationUseCase(RecommandationParms(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              recommmendationState: RequestState.error,
              recommendationMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              recommmendationState: RequestState.loaded,
              recommendation: r,
            )));
  }
}
