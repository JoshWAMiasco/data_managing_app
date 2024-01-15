import 'package:data_managing_app/screens/initialized_screen.dart';
import 'package:data_managing_app/screens/lobby_screen.dart';
import 'package:data_managing_app/screens/main_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String root = '/';
  static const String lobbyScreen = '/lobbyScreen';
  static const String mainScreen = '/mainScreen';

  final GoRouter route;
  AppRouter() : route = _router;

  static void popUntilFirst(BuildContext context) {
    while (GoRouter.of(context).canPop()) {
      debugPrint(GoRouter.of(context).location.toString()); //to get the routes in between
      GoRouter.of(context).pop();
    }
    GoRouter.of(context).pushReplacement('/');
  }

  static GoRouter get _router => GoRouter(
        routes: <RouteBase>[
          GoRoute(
            path: root,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: InitializedScreen(),
              );
            },
          ),
          GoRoute(
            path: lobbyScreen,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: const LobbyScreen(),
              );
            },
          ),
          GoRoute(
            path: mainScreen,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: const MainScreen(),
              );
            },
          )
        ],
      );
}
