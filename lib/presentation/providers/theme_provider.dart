import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Lista de colores inmutable
//provider es para valores inmutables osea que no van a cambiar
final colorListProvider = Provider((ref) => colorList);

//Booleano 
//StateProvider para mantener una pieza de estado como un solo valor entre varios
final isDarkMode = StateProvider((ref) => true);
final selectedColorProvider = StateProvider((ref) => 2);

//Objeto de tipo AppTheme (Custom)
//es como para mantener un estado pero cuando el objeto es mas elaborado
//El como controlador es ThemeNotifier y la instancia es de AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  (ref) => ThemeNotifier()
);

class ThemeNotifier extends StateNotifier<AppTheme>{
  //Estoy como creando una instancia de AppTheme
  //STATE = Estado = new AppTheme();
  ThemeNotifier(): super(AppTheme());
  // void algo (){
  //   state.isDarkMode;
  //   state.getTheme();
  //   state.isDarkMode;
  // }
  void toggleDarkmode(){
    state = state.copyWith( isDarkModeCopy : !state.isDarkMode);
  }

  void changeColorIndex(){
    
  }

}