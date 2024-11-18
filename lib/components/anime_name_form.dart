import 'package:flutter/material.dart';
import 'package:glorified_checkboxes/screens/anime_add_page2_screen.dart';

import '../classes/route_names.dart';

class AnimeNameForm extends StatefulWidget {
  const AnimeNameForm({Key? key}) : super(key: key);

  @override
  State<AnimeNameForm> createState() => _AnimeNameFormState();
}

class _AnimeNameFormState extends State<AnimeNameForm> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Anime name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                String animeName = _controller.text.trim().toUpperCase();

                if (animeName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Anime name cannot be empty!')),
                  );
                  return;
                }
                Navigator.pushNamed(context, RouteNames.addpage2,
                    arguments: Page2Arguments(animeName: animeName));
              },
              child: const Text("NEXT"))
        ],
      ),
    );
  }
}
