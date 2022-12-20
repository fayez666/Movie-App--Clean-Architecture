import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';

import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_event.dart';
import 'package:movies_app/movies/presentation/controller/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MovieBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUsecase)
      : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        final result = await getNowPlayingMoviesUseCase.excute();

        result.fold(
          (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(state.copyWith(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded)),
        );
      },
    );

    on<GetPopularMoviesEvent>(
      (event, emit) async {
        final result = await getPopularMoviesUseCase.excute();

        result.fold(
          (l) => emit(state.copyWith(
              popularState: RequestState.error, popularMessage: l.message)),
          (r) => emit(state.copyWith(
              popularState: RequestState.loaded, popularMovies: r)),
        );
      },
    );
    on<GetTopRatedMoviesEvent>(
      (event, emit) async {
        final result = await getTopRatedMoviesUsecase.excute();

        result.fold(
          (l) => emit(state.copyWith(
              topRatedState: RequestState.error, topRatedMessage: l.message)),
          (r) => emit(state.copyWith(
              topRatedState: RequestState.loaded, topRatedMovies: r)),
        );
      },
    );
  }
}
