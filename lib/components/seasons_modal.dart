import 'package:flutter/material.dart';
import 'package:glorified_checkboxes/classes/route_names.dart';
import 'package:glorified_checkboxes/screens/season_screen.dart';

class SeasonsModal extends StatelessWidget {
  const SeasonsModal(
      {Key? key, required this.seasonNumbers, required this.animeName})
      : super(key: key);

  final List<int> seasonNumbers;
  final String animeName;

  void _navigateToSeason(
      int seasonNumber, String animeName, BuildContext context) {
    SeasonScreenArguments args =
        SeasonScreenArguments(seasonNumber: seasonNumber, animeName: animeName);
    Navigator.pushNamed(context, RouteNames.season, arguments: args);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
      decoration: const BoxDecoration(
        color: Colors.white, // Background color of the bottom sheet
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: ListView.separated(
        itemCount: seasonNumbers.length,
        itemBuilder: (context, index) => ElevatedButton(
            onPressed: () {
              _navigateToSeason(seasonNumbers[index], animeName, context);
            },
            child: Text("Season ${seasonNumbers[index]}")),
        separatorBuilder: (context, index) => const SizedBox(
          height: 20,
        ),
      ),
    );
  }
}
