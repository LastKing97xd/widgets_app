import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    //final themeMode = ref.watch(isDarkMode);
    final themeMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: (){
              //ref.read(isDarkMode.notifier).update((state) => !state);
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            }, 
            // icon: themeMode ? const Icon(Icons.light_mode_outlined)
            //   : const Icon(Icons.dark_mode_outlined)
            icon: Icon(themeMode ? Icons.light_mode_outlined 
            : Icons.dark_mode_outlined)
          )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);

    final int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final colorVariable = colors[index];
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: colorVariable),),
          subtitle: Text('${colorVariable.value}'),
          //Color de la seleccion - bolita
          activeColor: colorVariable,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value) {
            //Es lo mismo
            //ref.read(selectedColorProvider.notifier).update((state) => state = index);
            ref.read(selectedColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}