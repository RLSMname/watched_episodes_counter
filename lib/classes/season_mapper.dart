import 'package:glorified_checkboxes/classes/season.dart';

class SeasonMapper {
  static List<Season> mapToSeasons(Map<int, int> seasonEpisodeMap) {
    // each key is a seasonNumber
    // each value is a totalEpisodes
    List<Season> list = [];

    for (var entry in seasonEpisodeMap.entries) {
      int seasonNumber = entry.key;
      int totalEpisodes = entry.value;
      list.add(
          Season(totalEpisodes: totalEpisodes, seasonNumber: seasonNumber));
    }

    return list;
  }
}
