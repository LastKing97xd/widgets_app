import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  
  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() { 
      //posicion actual -- maxima posicion que puede llegar
      //?Observacion OJO
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        loadNextPage();
      }
    });
  }

  //cuando sales entra al dispose por eso se cambia el estado de isMounted
  @override
  void dispose() {
    scrollController.dispose();
    //se define que termina el montado al dar atras
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async{
    if(isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));

    addFiveImages();
    isLoading = false;

    //Si me salgo sin llegar al setState se paraliza la app
    if(!isMounted) return;
    setState(() {});

     moveScrollToBottom();
  }

  Future<void> onRefresh() async{

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted) return;

    final last2Id = imagesIds.last;
    isLoading = false;
    imagesIds.clear();

    imagesIds.add(last2Id + 1);
    addFiveImages();

    setState(() {});

  }

  void moveScrollToBottom(){
    //determina la posicion actual y el final para que no mueva el scroll 
    // si cargo abajo y subo del todo no debe mover el scroll
    if(scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      //posicion a donde ira
      scrollController.position.pixels + 180, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  void addFiveImages() {
    //Ultimo valor de la lista
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Infinite Scroll'),
      // ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          //baja el indicador de la carga
          edgeOffset: 10,
          strokeWidth: 4,
          //onRefresh: () => onRefresh(),
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                //hace que la imagen se adapte a todo el espacio en este caso
                fit: BoxFit.cover,
                //ocupa todo el ancho disponible dentro de su contenedor padre
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/Images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300')
              );
            },
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        // child: const Icon(Icons.arrow_back),
        //evalua si isloading es true -> SpinPerfect, sino arrow_back
        child: isLoading ? SpinPerfect(
          infinite: true,
          child: const Icon(Icons.refresh_rounded)
        ) 
        : FadeIn(child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}