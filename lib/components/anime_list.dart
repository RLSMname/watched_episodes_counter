import 'package:flutter/material.dart';
import 'package:glorified_checkboxes/components/anime_tile.dart';

import '../classes/anime.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({Key? key, required this.animeList}) : super(key: key);

  final List<Anime> animeList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: animeList.length,
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemBuilder: (context, index) => AnimeTile(anime: animeList[index]));
  }
}
