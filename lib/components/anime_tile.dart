import 'package:flutter/material.dart';
import 'package:glorified_checkboxes/components/seasons_modal.dart';

import '../classes/anime.dart';
import '../classes/season.dart';

class AnimeTile extends StatelessWidget {
  const AnimeTile({Key? key, required this.anime}) : super(key: key);

  final Anime anime;

  @override
  Widget build(BuildContext context) {
    final int totalEpisodes = anime.totalEpisodes();
    final int completed = anime.numberEpisodesCompleted();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return SeasonsModal(
                  animeName: anime.name,
                  seasonNumbers:
                      anime.seasons.map((Season s) => s.seasonNumber).toList());
            });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  anime.name.toString().toUpperCase(),
                ),
              ),
              if (totalEpisodes != 0)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "${((completed / totalEpisodes) * 100).toStringAsFixed(1)}%",
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
