import 'package:flutter/material.dart';

// all the state will be managed by the notifiers
class Stamp extends StatelessWidget {
  const Stamp(
      {super.key,
      required this.episodeNumber,
      required this.onPressed,
      required this.isSeen});

  final int episodeNumber;
  final void Function(int) onPressed;
  final bool isSeen;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(episodeNumber),
      style: ElevatedButton.styleFrom(
          backgroundColor: isSeen ? Colors.green : Colors.white,
          side: const BorderSide(
            width: 1.0,
            color: Colors.black,
          )),
      child: Text("$episodeNumber"),
    );
  }
}
