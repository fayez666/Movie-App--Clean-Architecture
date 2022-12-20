import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final String? backdropPath;
  final int id;
  final String releaseDate;
  final String overview;
  final List<Genres> genres;
  final int runtime;
  final String title;
  final double voteAverage;

  const MovieDetail({
    required this.genres,
    required this.backdropPath,
    required this.id,
    required this.releaseDate,
    required this.overview,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        genres,
        overview,
        runtime,
        voteAverage,
        releaseDate
      ];
}
