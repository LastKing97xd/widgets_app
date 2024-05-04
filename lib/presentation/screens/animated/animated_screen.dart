import 'package:flutter/material.dart';
//de toda la libreria solo usar Random
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {

  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 120;
    height = random.nextInt(500) + 120;
    //borderRadius =  random.nextDouble() * 140;
    //Segun video
    borderRadius = random.nextInt(100) + 10;
    color = Color.fromRGBO(
      random.nextInt(255), //red
      random.nextInt(255), //green
      random.nextInt(255), //blue
      1); //opacity

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          //animacion entre cambios
          curve: Curves.elasticOut,
          //si el width es <= a 0  sera 0 sino es el mismo valor de width, osea el que ya viene
          width: width <= 0 ? 2 : width,
          height: height <= 0 ? 2 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        //se puede mandar asi porque ambos reciben la misma cantidad de argumentos
        onPressed: changeShape,
        // onPressed: () {
        //   changeShape();
        // },
        child: const Icon(Icons.play_arrow_rounded),

      ),
    );
  }
}