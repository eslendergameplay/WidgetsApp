import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Lista de color inmutable que no se modificara por eso Provider normal de riverpod
final colorListProvider = Provider((ref) => colorList);

//Un simpleBooleano mutable por eso StateProvider
final lightOrDarkModeProvider = StateProvider<bool>((ref) => false);

//Un simple int
final selectedColorProvider = StateProvider((ref) => 0);

//Un objeto de tipo AppTheme(custom)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  //State o Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }

  /*
  Mantiene un estado un poco mas elaborado el estado es un objeto a utilizar y se dara cuenta que al
  cambiar el state o se asigna el mismo estado o anterior y se encarga de notificar y redibujar.
  En el StateNotifierProvider permite mantener un estado un poco mas complejo ese estado es
  administrado por ThemeNotifier que es la clase que se creo para luego tener metodos para cambiar
  los datos lo que contendera el estado es el ThemeNotifier ya que tendra los metodos,este es de
  tipo AppTheme o su clase personalizada y luego definimos el ThemeNotifier que extendera de un State
  Notifier para que por medio del constructor super es necesario para establecer el estado inicial del mismo
  y debe ser sincrono.

  Un provider inmutable puede ser parte del ThemeNotifierProvier pero si se quiere manejar con el 
  ThemeNotifierProvider es solo una instancia del AppTheme hay varios maneras de cambiar el estado o
  que no sea necesario o se requiere el provider de StateNotifierProvider pero el argumento si no se quiere
  identificar cuando haya un cambio y la varible es final debe ser predecible  haciendo una copia del
  eatdo anterior permitiendo incluir paquetes como equalable pero se vera mas adelante pero se puede aprender.

  El provider es para un valor que sea inmutable,es decir,de lectura pero no de modificacion,el StateProvider
  es para un valor mutable y mantener ese valor o cambiarlo por otro del mismo tipo y StateNotifierProvider
  es para un objeto que lleva sus propiedades y metodos junto a una clase personalizada para usar sus
  instancias y asi poder manejar su estado por medio de los ConsumerWidget(StatelessWidget) y el Consumer
  StatefulWidget(StatefulWidget) por medio del providerScope en la funcion main y colocando para que
  su hijo sea la aplicacion y puede hacer referencia a las rerenderizaciones para los widgets.
  */
}
