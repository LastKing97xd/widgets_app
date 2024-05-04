import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});


  void showCustomSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('SnackBar'),
      action: SnackBarAction(label: 'Okk', onPressed: (){}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context){
    showDialog(
      // no permite cerrar el dialog cuando da click afuera, solo con los botones
      barrierDismissible: false,
      context: context, 
      //siempre el builder es en tiempo de ejecucion
      builder: (context) => AlertDialog(
        title: Text('Estas seguro?'),
        content: Text('Consectetur irure anim officia sit est. Nisi mollit consectetur ullamco irure in consectetur laboris ad occaecat. Sit duis elit Lorem aute nulla deserunt aliquip duis culpa. Consectetur deserunt dolor reprehenderit culpa excepteur reprehenderit elit. Ea laborum qui aliqua sint incididunt anim nulla. Cupidatat Lorem commodo mollit laborum veniam sint sint mollit incididunt.'),
        actions: [
          //botonos diferentes en el opendialog
          TextButton(
            //esto es gracias al goRouter
            onPressed: () => context.pop(), 
            child: Text('Cancelar')),
          FilledButton(
            //esto es gracias al goRouter
            onPressed: () => context.pop(),
            child: Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Consequat esse proident tempor esse commodo. Sunt irure ipsum eiusmod pariatur. Veniam laboris ipsum consequat mollit Lorem laboris amet nisi dolore non reprehenderit deserunt commodo proident. Occaecat duis voluptate pariatur ullamco eu magna non consectetur proident et occaecat nisi. Deserunt ut reprehenderit commodo adipisicing qui occaecat magna voluptate et id aute reprehenderit. Eiusmod duis ullamco qui tempor ullamco aliqua veniam ad. Do minim ea consequat ea excepteur tempor qui aliquip laborum adipisicing ea ut dolor.')
                  ]
                );
              }, 
              child: const Text('Licencias Usadas')
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar Dialogo')
            )
          ],
        )
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar SnackBard'),
        onPressed: () => showCustomSnackBar(context)
        // {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(content: Text('SnackBar')));
        // }, 
      ),
    );
  }
}