import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:super_cat/components/constants.dart';
import 'package:super_cat/components/widgets/gradient_card.dart';
import 'package:super_cat/features/catalog/model/gradient_model.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  List<MyGradient>? selectionList;

  @override
  void initState() {
    getSelectionList();
    super.initState();
  }

  Future<void> getSelectionList() async {
    final List<MyGradient> foo = [];
    for (String i in catalogList) {
      foo.addAll(
        await FirebaseFirestore.instance.collection(i).get().then(
          (v) {
            final gradientsList = v.docs.map(
              (elem) {
                final Map<String, dynamic> data = elem.data();
                final List<dynamic> color1 = data["color1"];
                final List<dynamic> color2 = data["color2"];
                final List<dynamic> color3 = data["color3"];
                return MyGradient(
                  color1: RGB(r: color1[0], g: color1[1], b: color1[2]),
                  color2: RGB(r: color2[0], g: color2[1], b: color2[2]),
                  color3: RGB(r: color3[0], g: color3[1], b: color3[2]),
                );
              }
            ).toList();
            return gradientsList;
          }
        )
      );
    }
    foo.shuffle();
    setState(() {
      selectionList = foo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selection"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: selectionList == null 
          ? const Center(
              child: CircularProgressIndicator(),
            ) 
          : ListView.builder(
              itemCount: selectionList!.length,
              itemBuilder:(context, index) {
                return GradientCard(
                  gradient: selectionList![index]
                );
              },
            )
      ),
    );
  }
}