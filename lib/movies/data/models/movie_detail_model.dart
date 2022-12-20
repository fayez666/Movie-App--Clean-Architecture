import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel(
      {required super.genres,
      super.backdropPath,
      required super.id,
      required super.releaseDate,
      required super.overview,
      required super.runtime,
      required super.title,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        genres: List<GenresModel>.from(
            json["genres"].map((x) => GenresModel.fromJson(x))),
        backdropPath:
            json["backdrop_path"] ?? '/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg',
        id: json["id"],
        releaseDate: json["release_date"],
        overview: json["overview"],
        runtime: json["runtime"],
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
