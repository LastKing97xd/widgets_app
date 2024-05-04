import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls + Tiles'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation {car, plane, boat, submarine}

class _UiControlsViewState extends State<_UiControlsView> {


  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  //Asi seria vacio
  //Transportation? selectedTransportation ;
  bool desayuno = false;
  bool almuerzo = false;
  bool cena = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles Adicionales'),
          value: isDeveloper, 
          onChanged: (value) => setState(() {
            // convertir al valor opuesto (=!)
            isDeveloper =! isDeveloper;
          })
        ),

        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viajar por carro'),
              value: Transportation.car, 
              groupValue: selectedTransportation, 
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),

            RadioListTile(
              title: const Text('By Boat'),
              subtitle: const Text('Viajar por barco'),
              value: Transportation.boat, 
              groupValue: selectedTransportation, 
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),

            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viajar por avion'),
              value: Transportation.plane, 
              groupValue: selectedTransportation, 
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),

            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viajar por submarino'),
              value: Transportation.submarine, 
              groupValue: selectedTransportation, 
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
      
        CheckboxListTile(
          title: const Text('Quiere Desayuno?'),
          value: desayuno, 
          onChanged: (value) => setState(() {
            desayuno =! desayuno;
          }),
        ),
        CheckboxListTile(
          title: const Text('Quiere Almuerzo?'),
          value: almuerzo, 
          onChanged: (value) => setState(() {
            almuerzo =! almuerzo;
          }),
        ),
        CheckboxListTile(
          title: const Text('Quiere Cena?'),
          value: cena, 
          onChanged: (value) => setState(() {
            cena =! cena;
          }),
        )
      ],
    );
  }
}