import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;
  //posicionales sin el required
  SlideInfo(this.title, this.caption, this.imageUrl);
}

final List<SlideInfo> slides = [
  SlideInfo('Busca la comida', 'Eu est mollit voluptate nostrud Lorem non nostrud non consectetur pariatur.', 'assets/Images/1.png'),
  SlideInfo('Entrega rapida', 'Non reprehenderit velit est pariatur veniam elit veniam cillum laboris est irure ullamco proident.', 'assets/Images/2.png'),
  SlideInfo('Disfruta la comida', 'Nostrud ea voluptate Lorem do.', 'assets/Images/3.png'),
];


class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageViewController = PageController();
  bool finalBarra = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
      //?? 0  sino tiene valor es 0
      final page = pageViewController.page ?? 0;
      //si el finalBarra es falso y el page es >= a el tamano 2 pero -1.5
      if(!finalBarra && page >= (slides.length - 1.5)){
        setState(() {
          finalBarra = true;
        });
      }
      //Se imprime en DegubConsole
      print('${pageViewController.page}');
     });
  }

  @override
  void dispose() {
    // TODO: implement dispose

    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //cambio color estatico para esta pantalla
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          
          PageView(
            //Sabe en que estado estamos, si estamos al final o al inicio
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            //puede ser cualquier variable pero suele ser semantica con el contexto del widget
            children: slides.map((vSemanticaRazon) => _Slide(
              title: vSemanticaRazon.title, 
              caption: vSemanticaRazon.caption, 
              imageUrl: vSemanticaRazon.imageUrl)
            ).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Skip o Salir'),
              //viene del goRouter
              onPressed: () => context.pop(),
            )
          ),

          finalBarra ? Positioned(
            right: 30,
            bottom: 30,
            //bullet - bolitas que marcan la pagina OJO
            child: FadeInRight(
              //que se mueva 15 uni.
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                child: const Text('Comenzar'),
                //viene del goRouter
                onPressed: () => context.pop(),
              ),
            )
            //sizedBox se recomienda usar si no quieres que se muestre otro widget
            //? si : no
          ) : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;


  const _Slide({required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge; //sirve para traer un estilo de texto
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          //vertical en la columna
          mainAxisAlignment: MainAxisAlignment.center,
          //horizontal en la columna
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            //Tambien se puede hacer de esta manera
            //Image.asset(imageUrl)

            const SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            const SizedBox(height: 10,),
            Text(caption, style: captionStyle,),
          ],
        ),
      ),
    );
  }
}