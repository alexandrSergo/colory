import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:super_cat/features/ghost/widgets/joke_widget.dart';

class GhostScreen extends StatefulWidget {
  const GhostScreen({super.key});

  @override
  State<GhostScreen> createState() => _GhostScreenState();
}

class _GhostScreenState extends State<GhostScreen> {
  List<String>? jokeList;

  @override
  void initState() {
    getJokes();
    super.initState();
  }

  Future<void> getJokes() async {
    await FirebaseFirestore.instance.collection("jokes").get().then(
      (value) {
        setState(() {
          jokeList = value.docs.map((e) {
            final Map<String, dynamic> data = e.data();
            final String joke = data["joke"].toString();
            return joke;
          }).toList();
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Приколы от GPT"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: jokeList == null 
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: jokeList!.length,
              itemBuilder: (context, index) {
                return JokeWidget(joke: jokeList![index],);
              },
            ),
      ),
    );
  }
}