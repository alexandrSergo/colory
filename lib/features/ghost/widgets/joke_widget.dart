import 'package:flutter/material.dart';

class JokeWidget extends StatelessWidget {
  const JokeWidget({super.key, required this.joke});
  final String joke;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints(
          minHeight: 180,
          maxWidth: double.infinity,
          minWidth: double.infinity
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 30, 30, 30),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(child: Text(correctString(joke))),
      ),
    );
  }
}

String correctString(String joke) {
  if (joke.contains("—")) {
    final List<String> foo = joke.split("—");
    String newJoke = '';
    for (String v in foo) {
      newJoke+= '—$v\n';
    }
    return newJoke.substring(2);
  } else {
    return joke;
  }
}