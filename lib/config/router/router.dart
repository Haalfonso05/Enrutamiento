import 'package:enrutamiento/config/router/router_model.dart';
import 'package:enrutamiento/presentation/screen/product/product_screen.dart';
import 'package:enrutamiento/presentation/screen/screen.dart';
import 'package:enrutamiento/presentation/screen/shared/layout.dart';
import 'package:go_router/go_router.dart';

List<RouterModel> appRoutes = [
  RouterModel(
    name: "Home",
    description: "Pantalla principal",
    path: "/",
    widget: (context, state) => const HomeScreen(),
  ),
  RouterModel(
    name: "Users",
    description: "Pantalla de usuarios",
    path: "/users",
    widget: (context, state) => const UsersScreen(),
  ),
  RouterModel(
    name: "Settings",
    description: "Pantalla de configuración",
    path: "/settings",
    widget: (context, state) => const SettingScreen(),
  ),
  RouterModel(
    name: "Arriba",
    description: "Pantalla de arriba",
    path: "/arriba",
    widget: (context, state) => const ArribaScreen(),
  ),
  RouterModel(
    name: "Abajo",
    description: "Pantalla de abajo",
    path: "/abajo",
    widget: (context, state) => const AbajoScreen(),
  ),
  RouterModel(
    name: "Product",
    description: "Pantalla de productos",
    path: "/product",
    widget: (context, state) => const ProductScreen(),
  ),
];

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) {
        print(state.topRoute?.name);
        return Layout(child: child, title: state.topRoute?.name ?? "");
      },
      routes: [
        ...appRoutes.map((route) {
          return GoRoute(
            path: route.path,
            name: route.name,
            builder: (context, state) => route.widget(context, state),
          );
        }), // appRoutes
      ],
    ), // ShellRoute
  ],
  errorBuilder: (context, state) => HomeScreen(), // <RouteBase>[]
); // GoRouter