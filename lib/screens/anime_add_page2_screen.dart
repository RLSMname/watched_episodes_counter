import 'package:flutter/material.dart';
import 'package:glorified_checkboxes/classes/anime_notifier.dart';
import 'package:glorified_checkboxes/components/anime_form.dart';
import 'package:glorified_checkboxes/components/app_bar_with_back.dart';
import 'package:provider/provider.dart';

import '../classes/anime.dart';
import '../classes/route_names.dart';

class Page2Arguments {
  final String animeName;

  Page2Arguments({required this.animeName});
}

class AnimeAddPage2Screen extends StatelessWidget {
  const AnimeAddPage2Screen({Key? key}) : super(key: key);

  void _addAnime(
      Anime animeToAdd, AnimeNotifier animeNotifier, BuildContext context) {
    animeNotifier.addAnime(animeToAdd);
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteNames.home,
      (Route<dynamic> route) => false, // This will clear the stack
    );
  }

  @override
  Widget build(BuildContext context) {
    final Page2Arguments args =
        ModalRoute.of(context)!.settings.arguments as Page2Arguments;

    return Consumer<AnimeNotifier>(builder: (context, animeNotifier, child) {
      return Scaffold(
        appBar: const AppBarWithBack(title: "Add each season"),
        body: AnimeForm(
            animeName: args.animeName,
            addAnime: (Anime a) => _addAnime(a, animeNotifier, context)),
      );
    });
  }
}
