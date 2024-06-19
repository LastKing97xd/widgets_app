import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //mira que cambios hay
    final int clickCounter = ref.watch(counterProvider);
    final bool themeMode = ref.watch(isDarkMode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(isDarkMode.notifier).update((state) => !state);
            }, 
            // icon: themeMode ? const Icon(Icons.light_mode_outlined)
            //   : const Icon(Icons.dark_mode_outlined)
            icon: Icon(themeMode ? Icons.light_mode_outlined 
            : Icons.dark_mode_outlined)
          )
        ],
      ),
      body: _CounterView(clickCounter2: clickCounter,),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //lee el valor
          //ref.read(counterProvider.notifier).state ++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add_box_outlined),
      ),
    );
  }
}

class _CounterView extends StatelessWidget {

  final int clickCounter2;
  const _CounterView({required this.clickCounter2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
            'Valor: $clickCounter2', 
            // style: TextStyle(fontSize: 25),
            style: Theme.of(context).textTheme.titleLarge,
          ),

      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(
      //       'Valor: $clickCounter2', 
      //       // style: TextStyle(fontSize: 25),
      //       style: Theme.of(context).textTheme.titleLarge,
      //     )
      //   ],
      // ),
    );
  }
}