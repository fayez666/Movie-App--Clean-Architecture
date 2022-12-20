import 'package:movies_app/movies/domain/entities/recommandation.dart';

class RecommandationModel extends Recommendation {
  const RecommandationModel({required super.backdropPath, required super.id});

  factory RecommandationModel.fromJson(Map<String, dynamic> json) =>
      RecommandationModel(
          backdropPath:
              json["backdrop_path"] ?? "/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg",
          id: json["id"]);
}
