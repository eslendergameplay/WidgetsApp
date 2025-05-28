import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

extension ColorExtension on Color {
  String toHex() =>
      '#${(a.toInt() << 24 | r.toInt() << 16 | g.toInt() << 8 | b.toInt()).toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_changer_screen';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(title: Text('ThemeChanger.'), actions: [
        IconButton(
            icon: Icon((isDarkMode)
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
          
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              
            })
      ]),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final List<Color> colors = ref.watch(colorListProvider);
    
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final color = colors[index];
          return RadioListTile(
              title: Text('Este Color.', style: TextStyle(color: color)),
              value: index,
              
              groupValue: selectedColor,
              onChanged: (value) {
                
                ref
                    .read(themeNotifierProvider.notifier)
                    .changeColorIndex(index);
                
              },
              subtitle: Text('Color : ${color.toHex()}'),
              activeColor: color);
        });
        
  }
}
