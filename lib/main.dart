import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tabnews/routing/app_routes.dart';
import 'package:tabnews/ui/screens/root/root_module.dart';
import 'package:tabnews/ui/theme/theme_metrics.dart';
import 'package:tabnews/ui/theme/theme_text.dart';
import 'package:tabnewsnc_ui/tabnewsnc_ui.dart';

void main() => runApp(
  ModularApp(
    module: RootModule(),
    child: const MyApp(),
  ),
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

final class _MyAppState extends State<MyApp> {
  late final DefaultAppTheme _theme;

  @override
  void initState() {
    super.initState();
    Modular.setInitialRoute(AppRoutes.root);
    _theme = const DefaultAppTheme(
      text: ThemeTextImpl(),
      metrics: ThemeMetricsImpl(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TabNews',
      themeMode: .dark,
      theme: _theme.light,
      darkTheme: _theme.dark,
      locale: const Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
