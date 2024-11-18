import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glorified_checkboxes/classes/season_mapper.dart';
import 'package:glorified_checkboxes/components/plus_button.dart';

import '../classes/anime.dart';
import '../classes/validation_errors.dart';

//todo: add validation

class AnimeForm extends StatefulWidget {
  final String animeName;

  final void Function(Anime animeToAdd) addAnime;

  const AnimeForm({Key? key, required this.animeName, required this.addAnime})
      : super(key: key);

  @override
  State<AnimeForm> createState() => _AnimeFormState();
}

class _AnimeFormState extends State<AnimeForm> {
  final List<TextEditingController> _controllers = [TextEditingController()];

  void _addSeason() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  List<String> _getSeasonValues() {
    return _controllers.map((controller) => controller.text).toList();
  }

  //possible improvement if necessary: extract the maxNumber of episodes
  String _validate(List<String> seasonValues) {
    if (seasonValues.any((String value) => value.isEmpty)) {
      return ValidationErrors.emptyFields;
    }

    //gets the numbers that are less than 1000
    List<int> smallSeasonLengths = seasonValues
        .where((String value) => value.length <= 3)
        .map((String smallNumber) => int.parse(smallNumber))
        .toList();

    //had seasons with more than 999 episodes
    if (seasonValues.length != smallSeasonLengths.length) {
      return ValidationErrors.tooManyEpisodes;
    }

    //seasons with more than 100 episodes
    if (smallSeasonLengths.any((int lenght) => lenght > 100)) {
      return ValidationErrors.tooManyEpisodes;
    }

    //seasons with no episodes
    if (smallSeasonLengths.any((int length) => length == 0)) {
      return ValidationErrors.noEpisodes;
    }

    return "";
  }

  Map<int, int> _getSeasonEpisodeMap(
      BuildContext context, List<String> seasonValues) {
    String validationError = _validate(seasonValues);
    if (validationError.isNotEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(validationError)));
      return {};
    }

    // since all the values are correct at this point i can safely parse them
    Map<int, int> seasonMap = {};
    for (int i = 0; i < seasonValues.length; i++) {
      int seasonNumber = i + 1;
      int episodeCount = int.parse(seasonValues[i]);
      seasonMap[seasonNumber] = episodeCount;
    }
    return seasonMap;
  }

  Anime _constructAnime(String animeName, Map<int, int> seasonEpisodeMap) {
    return Anime(
        seasons: SeasonMapper.mapToSeasons(seasonEpisodeMap), name: animeName);
  }

  void _onSubmit(
      BuildContext context, String animeName, void Function(Anime) addAnime) {
    print("IN ON SUBMIT wiht animeName='$animeName'");

    List<String> seasonValues = _getSeasonValues();
    Map<int, int> seasonEpisodeMap =
        _getSeasonEpisodeMap(context, seasonValues);

    if (seasonEpisodeMap.isEmpty) return;

    Anime animeToAdd = _constructAnime(animeName, seasonEpisodeMap);

    //call addAnime(anime) from higher order widget
    addAnime(animeToAdd); //???
  }

  @override
  Widget build(BuildContext context) {
    final String animeName = widget.animeName;
    final void Function(Anime) addAnime = widget.addAnime;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: _controllers.length,
                itemBuilder: (context, index) => Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: TextField(
                              controller: _controllers[index],
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                labelText: 'Season ${index + 1}',
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                          if (index == 0) const Spacer(),
                          if (index == 0)
                            PlusButton(
                              onPressed: _addSeason,
                              horizontalPadding: 15,
                            )
                        ])),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                _onSubmit(context, animeName, addAnime);
              },
              child: const Text("SUBMIT"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers to free up resources
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
