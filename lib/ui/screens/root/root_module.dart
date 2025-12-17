import 'package:flutter_modular/flutter_modular.dart';
import 'package:tabnews/routing/app_routes.dart';
import 'package:tabnews/ui/screens/root/root_screen.dart';

final class RootModule extends Module {
  @override
  void routes(RouteManager r) => r.child(
    AppRoutes.root,
    child: (_) => const RootScreen(),
  );
}
