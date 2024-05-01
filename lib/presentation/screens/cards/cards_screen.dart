import 'package:flutter/material.dart';

const List<Map<String, dynamic>> cards = [
  { 'elevation': 0.0, 'label': 'Elevation 0' },
  { 'elevation': 1.0, 'label': 'Elevation 1' },
  { 'elevation': 2.0, 'label': 'Elevation 2' },
  { 'elevation': 3.0, 'label': 'Elevation 3' },
  { 'elevation': 4.0, 'label': 'Elevation 4' },
  { 'elevation': 5.0, 'label': 'Elevation 5' },
];

class CardsScreen extends StatelessWidget {

  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: Container()
    );
  }
}