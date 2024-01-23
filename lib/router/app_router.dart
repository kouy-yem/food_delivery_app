
import 'package:go_router/go_router.dart';
import '../features/authentication/login/view/login_view.dart';
import '../features/authentication/status_view.dart';
import '../features/home/view/home_view.dart';
import '../features/main/view/main_view.dart';
import '../features/splash/view/splash_view.dart';


class AppRouter {
  AppRouter._();

  static final routerConfig = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.routePath,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: HomeView.routePath,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: LoginView.routePath,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
          path: MainView.routePath,
          builder: (context, state) => MainView()
      ),
      GoRoute(
          path: StatusView.routePath,
          builder: (context, state) => StatusView()
      ),

    ],
  );
}
