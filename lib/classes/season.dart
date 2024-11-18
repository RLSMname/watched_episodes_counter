import 'package:flutter/material.dart';

class Season extends ChangeNotifier {
  List<int> filledStamps;
  final int totalEpisodes;
  final int seasonNumber;

  Season({required this.totalEpisodes, required this.seasonNumber})
      : filledStamps = [];

  void addStamp(int episodeNumber) {
    if (!filledStamps.contains(episodeNumber)) {
      filledStamps.add(episodeNumber);
      notifyListeners();
    }
  }

  void removeStamp(int episodeNumber) {
    filledStamps.remove(episodeNumber);
    notifyListeners();
  }

  @override
  String toString() {
    return 'Season $seasonNumber';
  }
}
