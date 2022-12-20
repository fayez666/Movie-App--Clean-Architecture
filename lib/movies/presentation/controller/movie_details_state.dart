import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/recommandation.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/movie_detail.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailMessage;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailMessage,
    List<Recommendation>? recommendation,
    RequestState? recommmendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailMessage: movieDetailMessage ?? this.movieDetailMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailMessage = '',
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsState,
        movieDetailMessage,
        recommendation,
        recommendationMessage,
        recommendationState
      ];
}
