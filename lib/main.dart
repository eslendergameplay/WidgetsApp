import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(ProviderScope(child: WidgetApp()));
}

class WidgetApp extends ConsumerWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
        title: 'WidgetsApp.',
        debugShowCheckedModeBanner: false,
        theme: appTheme.getTheme(),
        routerConfig: appRouter,
        );
  }
}
