import 'package:glorified_checkboxes/classes/season.dart';

class Anime {
  final List<Season> seasons;
  final String name;

  Anime({required this.seasons, required this.name});

  int totalEpisodes() {
    if (seasons.isEmpty) return 0;
    return seasons
        .map((Season s) => s.totalEpisodes)
        .reduce((value, element) => value + element);
  }

  int numberEpisodesCompleted() {
    if (seasons.isEmpty) return 0;
    return seasons
        .map((Season s) => s.filledStamps.length)
        .reduce((value, element) => value + element);
  }
}
