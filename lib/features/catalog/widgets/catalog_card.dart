import 'package:flutter/material.dart';
import 'package:super_cat/components/constants.dart';
import 'package:super_cat/features/catalog/view/gradient_screen.dart';

class CatalogCard extends StatelessWidget {
  const CatalogCard({super.key, 
    required this.collection
  });
  final String collection;

  void _onCollectionTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => GradientScreen(collection: collection,)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: kGradient
      ),
      child: Container(
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 227, 255, 254),
          borderRadius: BorderRadius.circular(12)
        ),
        child: TextButton(
          onPressed: () {
            _onCollectionTap(context);
          },
          child: Text(collection, style: TextStyle(color: getColor(collection), fontSize: 17),),
        ),
      ),
    );
  }
}

Color getColor(String collection) {
  late Color color;

  switch (collection) {
    case "blue":
      color = const Color.fromARGB(255, 6, 134, 239);
      break;
    case "cyan":
      color = const Color.fromARGB(255, 62, 231, 249);
      break;
    case "dark":
      color = const Color.fromARGB(255, 61, 61, 61);
      break;
    case "golden":
      color = const Color.fromARGB(255, 215, 203, 39);
      break;
    case "green":
      color = const Color.fromARGB(255, 6, 172, 0);
      break;
    case "lime":
      color = const Color.fromARGB(255, 67, 255, 61);
      break;
    case "mixed":
      color = const Color.fromARGB(255, 32, 0, 172);
      break;
    case "orange":
      color = const Color.fromARGB(255, 248, 159, 51);
      break;
    case "pastel":
      color = const Color.fromARGB(255, 217, 168, 214);
      break;
    case "pink":
      color = const Color.fromARGB(255, 241, 45, 222);
      break;
    case "purple":
      color = const Color.fromARGB(255, 136, 2, 189);
      break;
    case "red":
      color = const Color.fromARGB(255, 231, 3, 3);
      break;
    case "silver":
      color = const Color.fromARGB(255, 148, 153, 148);
      break;
    case "yellow":
      color = const Color.fromARGB(255, 227, 227, 6);
      break;
    default:
      color = Colors.white;
  }

  return color;
}