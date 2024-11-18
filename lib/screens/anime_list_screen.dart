import 'package:flutter/material.dart';
import 'package:glorified_checkboxes/classes/anime_notifier.dart';
import 'package:glorified_checkboxes/classes/route_names.dart';
import 'package:glorified_checkboxes/components/anime_list.dart';
import 'package:glorified_checkboxes/components/app_bar_centered.dart';
import 'package:glorified_checkboxes/components/plus_button.dart';
import 'package:provider/provider.dart';

class AnimeListScreen extends StatelessWidget {
  const AnimeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimeNotifier>(builder: (context, animeNotifier, child) {
      return Scaffold(
        appBar: const AppBarCentered(title: "My anime list"),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Text("${animeNotifier.totalNumberOfEpisodesWatched()} WATCHED"),
              PlusButton(onPressed: () {
                Navigator.pushNamed(context, RouteNames.addpage1);
              }),
              const SizedBox(
                height: 30,
              ),
              Expanded(child: AnimeList(animeList: animeNotifier.animes)),
            ],
          ),
        ),
      );
    });
  }
}
