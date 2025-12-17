import 'package:flutter_modular/flutter_modular.dart';
import 'package:tabnews/routing/app_routes.dart';
import 'package:tabnews/ui/screens/home/home_view_model.dart';
import 'package:tabnews/ui/screens/root/root_screen.dart';
import 'package:tabnewsnc_engine/tabnewsnc_engine.dart';

final class RootModule extends Module {
  @override
  void binds(Injector i) => i
    ..addSingleton<NewsRepository>(
      () => NewsRepositoryImpl(HttpServiceImpl()),
    )
    ..addSingleton<HomeViewModel>(
      HomeViewModel.new,
      config: BindConfig(onDispose: (h) => h.dispose()),
    );

  @override
  void routes(RouteManager r) => r.child(
    AppRoutes.root,
    child: (_) => const RootScreen(),
  );
}
