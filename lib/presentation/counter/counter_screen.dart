import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    final int counterValue = ref.watch(counterProvider);
    final lORDMode = ref.watch(lightOrDarkModeProvider);

    return Scaffold(
        appBar:
            AppBar(title: const Text('Counter Screen Con Riverpod.'), actions: [
          IconButton(
              onPressed: () {
                
                ref.read(lightOrDarkModeProvider.notifier).update((state)=> state = !state);
              },
              icon: Icon((lORDMode)
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ]),
        body: Center(
            child: Text(
                'Valor del Contador : ${(counterValue < 0) ? '0' : counterValue}',
                style: textStyle)),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
            child: const Icon(Icons.add)));
            
  }
}
