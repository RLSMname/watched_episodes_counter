import 'package:flutter/material.dart';
import 'package:glorified_checkboxes/classes/season.dart';

import 'anime.dart';

class AnimeNotifier extends ChangeNotifier {
  List<Anime> animes = [];

  void _onSeasonChanged() {
    notifyListeners();
  }

  AnimeNotifier({required this.animes}) {
    for (var anime in animes) {
      for (var season in anime.seasons) {
        season.addListener(_onSeasonChanged);
      }
    }
  }

  int totalNumberOfEpisodesWatched() {
    if (animes.isEmpty) return 0;
    return animes
        .map((Anime anime) => anime.numberEpisodesCompleted())
        .reduce((value, element) => value + element);
  }

  void addAnime(Anime anime) {
    animes.add(anime);
    for (var season in anime.seasons) {
      season.addListener(_onSeasonChanged);
    }
    notifyListeners();
  }

  void removeAnime(Anime anime) {
    animes.remove(anime);
    for (var season in anime.seasons) {
      season.removeListener(_onSeasonChanged);
      notifyListeners();
    }
  }

  void updateStampsForSeason(
      String animeName, int episodeNumber, bool isAdding, int seasonNumber) {
    final Anime anime = animes.firstWhere((a) {
      return a.name == animeName;
    });

    final Season season = anime.seasons.firstWhere((s) {
      return s.seasonNumber == seasonNumber;
    });

    if (isAdding) {
      season.addStamp(episodeNumber);
    } else {
      season.removeStamp(episodeNumber);
    }
  }

  Season? getSeason(String animeName, int seasonNumber) {
    try {
      final anime = animes.firstWhere((a) => a.name == animeName);

      final season =
          anime.seasons.firstWhere((s) => s.seasonNumber == seasonNumber);

      return season;
    } catch (e) {
      return null;
    }
  }
}
