import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:super_cat/components/widgets/gradient_card.dart';
import 'package:super_cat/features/catalog/model/gradient_model.dart';

class GradientScreen extends StatefulWidget {
  const GradientScreen({super.key, required this.collection});
  final String collection;

  @override
  State<GradientScreen> createState() => _GradientScreenState();
}

class _GradientScreenState extends State<GradientScreen> {

  List<MyGradient>? gradientsList;

  @override
  void initState() {
    getGradientList();
    super.initState();
  }

  // Map<String, List<int>> map = {
  //   "color1": [1, 2, 3],
  //   "color2": [1, 2, 3],
  //   "color3": [1, 2, 3],
  // };

  Future<void> getGradientList() async {
    await FirebaseFirestore.instance.collection(widget.collection).get().then(
      (v) {
        setState(() {
          gradientsList = v.docs.map(
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
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.collection)
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            width: 500,
            child: gradientsList != null 
              ? ListView.builder(
                  itemCount: gradientsList!.length,
                  itemBuilder: (context, index) {
                    return GradientCard(
                      gradient: gradientsList![index]
                    );
                  }
                ) 
              : const Center(
                  child: CircularProgressIndicator(),
                )
          ),
        ),
      ),
    );
  }
}