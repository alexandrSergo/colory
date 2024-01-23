import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_color_picker_wheel/models/button_behaviour.dart';
import 'package:flutter_color_picker_wheel/presets/animation_config_presets.dart';
import 'package:flutter_color_picker_wheel/presets/color_presets.dart';
import 'package:flutter_color_picker_wheel/widgets/flutter_color_picker_wheel.dart';
import 'package:super_cat/components/widgets/gradient_card.dart';
import 'package:super_cat/features/catalog/model/gradient_model.dart';

class ColorWheelScreen extends StatefulWidget {
  const ColorWheelScreen({super.key});

  @override
  State<ColorWheelScreen> createState() => _ColorWheelScreenState();
}

class _ColorWheelScreenState extends State<ColorWheelScreen> {

  final int randomK = 50;

  Color currentColor = Colors.red;

  late RGB currentRGB1;
  late RGB currentRGB2;
  late RGB currentRGB3;

  @override
  void initState() {
    setState(() {
      currentRGB1 = RGB(
        r: currentColor.red, 
        g: currentColor.green, 
        b: currentColor.blue
      );
      currentRGB2 = RGB(
        r: currentColor.red, 
        g: currentColor.green, 
        b: currentColor.blue
      );
      currentRGB3 = RGB(
        r: currentColor.red, 
        g: currentColor.green, 
        b: currentColor.blue
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Wheel"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WheelColorPicker(
              onSelect: (Color color) {
                Random random = Random();
                setState(() {
                  currentColor = color;
                  currentRGB1 = RGB(
                    r: currentColor.red + random.nextInt(randomK), 
                    g: currentColor.green + random.nextInt(randomK), 
                    b: currentColor.blue + random.nextInt(randomK)
                  );
                  currentRGB2 = RGB(
                    r: currentColor.red + random.nextInt(randomK), 
                    g: currentColor.green + random.nextInt(randomK), 
                    b: currentColor.blue + random.nextInt(randomK)
                  );
                  currentRGB3 = RGB(
                    r: currentColor.red + random.nextInt(randomK), 
                    g: currentColor.green + random.nextInt(randomK), 
                    b: currentColor.blue + random.nextInt(randomK)
                  );
                });
              },
              behaviour: ButtonBehaviour.clickToOpen,
              defaultColor: currentColor,
              animationConfig: sunRayLikeAnimationConfig,   
              colorList: simpleColors,
              buttonSize: 40,
              pieceHeight: 25,
              innerRadius: 45,
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: GradientCard(
                gradient: MyGradient(
                  color1: currentRGB1, 
                  color2: currentRGB2, 
                  color3: currentRGB3
                )
              ),
            )
          ],
        ),
      )
    );
  }
}