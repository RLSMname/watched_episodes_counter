import 'package:flutter/material.dart';
import 'package:glorified_checkboxes/classes/anime_notifier.dart';
import 'package:glorified_checkboxes/components/app_bar_with_back.dart';
import 'package:glorified_checkboxes/components/stamp_grid_view.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../classes/season.dart';
import '../components/stamp.dart';

class SeasonScreenArguments {
  final int seasonNumber;
  final String animeName;

  SeasonScreenArguments({required this.seasonNumber, required this.animeName});
}

class SeasonScreen extends StatelessWidget {
  const SeasonScreen({super.key});

  // final int seasonNumber;
  // final String animeName;

  List<Stamp> generateStamps(Season season, AnimeNotifier animeNotifier,
      String animeName, int seasonNumber) {
    return List.generate(season.totalEpisodes, (index) {
      final episodeNumber = index + 1;
      final isSeen = season.filledStamps.contains(episodeNumber);

      return Stamp(
        episodeNumber: episodeNumber,
        isSeen: isSeen,
        onPressed: (episodeNumber) {
          animeNotifier.updateStampsForSeason(
            animeName,
            episodeNumber,
            !isSeen,
            seasonNumber,
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final SeasonScreenArguments args =
        ModalRoute.of(context)?.settings.arguments as SeasonScreenArguments;

    String animeName = args.animeName;
    int seasonNumber = args.seasonNumber;

    return Consumer<AnimeNotifier>(
      builder: (context, animeNotifier, child) {
        final Season? season = animeNotifier.getSeason(animeName, seasonNumber);

        return Scaffold(
          appBar: AppBarWithBack(title: "Season $seasonNumber - $animeName"),
          body: season == null
              ? const Center(child: Text("Season not found"))
              : Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LinearPercentIndicator(
                        barRadius: const Radius.circular(30),
                        lineHeight: 20.0,
                        percent:
                            season.filledStamps.length / season.totalEpisodes,
                        backgroundColor:
                            Theme.of(context).colorScheme.inversePrimary,
                        progressColor: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: StampGridView(
                            children: generateStamps(season, animeNotifier,
                                animeName, seasonNumber)),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
