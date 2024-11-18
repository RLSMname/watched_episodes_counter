import 'package:flutter/material.dart';

class StampGridView extends StatelessWidget {
  const StampGridView({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      children: children,
    );
  }
}
