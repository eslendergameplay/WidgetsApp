import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  bool isMounted = true;
  bool isLoading = false;
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        removeBottom: true,
        removeTop: true,
        context: context,
        child: Scaffold(
            backgroundColor: Colors.black,
            body: RefreshIndicator(
              edgeOffset: 10,
              strokeWidth: 2,
              onRefresh: () {
                return onRefresh();
                /*
                O onRefresh : onRefresh, se coloca asi porque tiene los mismos argumentos o parametros
                */
              },
              child: ListView.builder(
                  itemCount: imagesIds.length,
                  itemBuilder: (context, index) {
                    return FadeInImage(
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300,
                        placeholder:
                            const AssetImage('assets/images/jar-loading.gif'),
                        image: NetworkImage(
                            'https://picsum.photos/id/${imagesIds[index]}/500/300'));
                  }),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () => context.pop(),
                //Para colocar un ternario y con la animacion no sea tan duro o estricto
                child: (isLoading)
                    ? SpinPerfect(
                        infinite: true,
                        child: const Icon(Icons.refresh_rounded))
                    : FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined)))));
  }

  void addFiveImages() {
    final lastid = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastid + e));
    //setState(() {});
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    if (!isMounted) return;
    setState(() {
      moveScrollToBottom();
    });
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;
    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    setState(() {});
  }

  void moveScrollToBottom() {
    if ((scrollController.position.pixels + 150) <=
        scrollController.position.maxScrollExtent) return;
    /*
    Se coloca primero a que posicion ira y si se quiere arriba en vez de 120 seria 0 por eso es 120 abajo
    y este se estira abajo si no se extiendio lo sufientemente menos de el scroll maximo o igual no se cumple la
    condicion.
    */    
    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      /*scrollController.position.pixels y al estar debajo del todo y exceder el scrolld maximo se cumple la 
      condicion
      */
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //LoadNextpage
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    /*
    Se llama cuando el componente esta siendo destruido o sera destruido,esta destruido o marca a ser destruido
    */
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }
}
