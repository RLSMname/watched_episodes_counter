import 'package:flutter/material.dart';
import 'package:glorified_checkboxes/classes/route_names.dart';
import 'package:glorified_checkboxes/screens/anime_add_page1_screen.dart';
import 'package:glorified_checkboxes/screens/anime_add_page2_screen.dart';
import 'package:glorified_checkboxes/screens/anime_list_screen.dart';
import 'package:glorified_checkboxes/screens/season_screen.dart';
import 'package:provider/provider.dart';

import 'classes/anime.dart';
import 'classes/anime_notifier.dart';
import 'classes/season.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mockAnimes = [
      Anime(
        name: "Naruto",
        seasons: [
          Season(seasonNumber: 1, totalEpisodes: 50)
            ..addStamp(1) // Mark episode 1 as watched
            ..addStamp(3) // Mark episode 3 as watched
            ..addStamp(5), // Mark episode 5 as watched
          Season(seasonNumber: 2, totalEpisodes: 12),
        ],
      ),
      Anime(
        name: "One Piece",
        seasons: [
          Season(seasonNumber: 1, totalEpisodes: 5),
          Season(seasonNumber: 2, totalEpisodes: 8)
            ..addStamp(2) // Mark episode 2 as watched
            ..addStamp(4), // Mark episode 4 as watched
        ],
      ),
    ];

    return ChangeNotifierProvider(
      create: (_) => AnimeNotifier(animes: mockAnimes),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green[900]!),
          useMaterial3: true,
        ),
        home: const AnimeListScreen(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          RouteNames.home: (context) => const AnimeListScreen(),
          RouteNames.addpage1: (context) => const AnimeAddPage1Screen(),
          RouteNames.addpage2: (context) => const AnimeAddPage2Screen(),
          RouteNames.season: (context) => const SeasonScreen()
        },
      ),
    );
  }
}
