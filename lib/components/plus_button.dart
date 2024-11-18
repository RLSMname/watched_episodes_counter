import 'package:flutter/material.dart';

class PlusButton extends StatelessWidget {
  const PlusButton(
      {super.key, required this.onPressed, this.horizontalPadding = 40.0});

  final void Function() onPressed;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: const Icon(Icons.add_circle_outline),
        tooltip: 'Add a new anime',
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
        ),
        iconSize: 30,
        color: Colors.white,
      ),
    );
  }
}
