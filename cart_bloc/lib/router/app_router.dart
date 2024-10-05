import 'package:cart_bloc/screen/cart_screen.dart';
import 'package:cart_bloc/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartScreen(),
      )
    ],
  );
}
