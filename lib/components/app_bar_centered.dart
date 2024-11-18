import 'package:flutter/material.dart';

class AppBarCentered extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarCentered({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
