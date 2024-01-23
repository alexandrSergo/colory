import 'package:flutter/material.dart';
import 'package:super_cat/components/constants.dart';
import 'package:super_cat/features/catalog/model/gradient_model.dart';

class GradientCard extends StatelessWidget {
  const GradientCard({super.key, required this.gradient});
  final MyGradient gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              gradient: LinearGradient(
                colors: gradient.getGradientList()
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 26, 26, 26),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultTabController(
                  length: 3, 
                  child: Column(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: TabBar(
                          indicatorColor: kColor2,
                          tabs: [
                            SizedBox(
                              width: 106,
                              child: Tab(
                                child: Text('RGBO'),
                              ),
                            ),
                            SizedBox(
                              width: 106,
                              child: Tab(
                                child: Text('HEX'),
                              ),
                            ),
                            SizedBox(
                              width: 106,
                              child: Tab(
                                child: Text('ARGB'),
                              ),
                            ),
                          ]
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 320,
                        height: 64,
                        child: TabBarView(
                          children: [
                            Tab(
                              child: Column(
                                children: [
                                  Text(gradient.color1.getRGBO()),
                                  Text(gradient.color2.getRGBO()),
                                  Text(gradient.color3.getRGBO()),
                                ],
                              ),
                            ),
                            Tab(
                              child: Column(
                                children: [
                                  Text(gradient.color1.getHEX()),
                                  Text(gradient.color2.getHEX()),
                                  Text(gradient.color3.getHEX()),
                                ],
                              ),
                            ),
                            Tab(
                              child: Column(
                                children: [
                                  Text(gradient.color1.getARGB()),
                                  Text(gradient.color2.getARGB()),
                                  Text(gradient.color3.getARGB()),
                                ],
                              ),
                            ),
                          ]
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}