import 'package:hive/hive.dart';

// ✅ تحديد type adapter ID فريد (أي رقم من 0-223)
part 'movie_model.g.dart';

@HiveType(typeId: 0)
class MovieModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String originalTitle;

  @HiveField(3)
  final String originalLanguage;

  @HiveField(4)
  final String overview;

  @HiveField(5)
  final String? posterPath;

  @HiveField(6)
  final String? backdropPath;

  @HiveField(7)
  final double popularity;

  @HiveField(8)
  final String releaseDate;

  @HiveField(9)
  final double voteAverage;

  @HiveField(10)
  final int voteCount;

  @HiveField(11)
  final bool adult;

  @HiveField(12)
  final bool video;

  @HiveField(13)
  final List<int> genreIds;

  MovieModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.originalLanguage,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.popularity,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.adult,
    required this.video,
    required this.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      originalTitle: json['original_title'] as String,
      originalLanguage: json['original_language'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
      releaseDate: json['release_date'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      adult: json['adult'] as bool,
      video: json['video'] as bool,
      genreIds: List<int>.from(json['genre_ids'] as List),
    );
  }

  @override
  String toString() {
    return 'MovieModel(id: $id, title: $title, releaseDate: $releaseDate)';
  }
}