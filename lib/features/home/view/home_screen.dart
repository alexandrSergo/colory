import 'package:flutter/material.dart';
import 'package:super_cat/features/catalog/view/catalog_screen.dart';
import 'package:super_cat/features/color_wheel/view/color_wheel_screen.dart';
import 'package:super_cat/features/ghost/view/ghost_screen.dart';
import 'package:super_cat/features/home/widgets/gradient_border_button.dart';
import 'package:super_cat/features/home/widgets/gradient_button.dart';
import 'package:super_cat/features/selection/view/selection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onCatalogTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CatalogScreen()));
  }

  void _onSelectionTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SelectionScreen()));
  }

  void _onGhostTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const GhostScreen()));
  }

  void _onColorWheelTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ColorWheelScreen()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              const Text("Colory", style: TextStyle(color: Color.fromARGB(255, 70, 218, 248), fontSize: 30),),
              const SizedBox(
                height: 100,
              ),
              GradientButton(
                text: "Catalog",
                onPressed: () {
                  _onCatalogTap(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GradientButton(
                text: "Selection",
                onPressed: () {
                  _onSelectionTap(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GradientBorderButton(
                text: "Favourites",
                onPressed: () {
                  
                },
              ),
              const SizedBox(
                height: 20,
              ),
              GradientBorderButton(
                text: "Color Wheel",
                onPressed: () {
                  _onColorWheelTap(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 240,
                decoration: const BoxDecoration(
                  color: Colors.transparent
                ),
                child: TextButton(
                  onPressed: () {
                    _onGhostTap(context);
                  },
                  child: const Text("Ghost", style: TextStyle(color: Color.fromARGB(255, 46, 46, 46)),),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}