class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "33da29d2d123c19b59fa58ac90870273";
  static const String nowPLayingMoviePath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviePath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMoviePath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  static String recommandationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static String imageUrl(String path) {
    return '$baseImageUrl$path';
  }
}
