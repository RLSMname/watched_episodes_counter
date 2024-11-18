import 'package:flutter/material.dart';
import 'package:glorified_checkboxes/components/anime_name_form.dart';
import 'package:glorified_checkboxes/components/app_bar_with_back.dart';

class AnimeAddPage1Screen extends StatelessWidget {
  const AnimeAddPage1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWithBack(title: "Add"),
      body: Center(child: AnimeNameForm()),
    );
  }
}
