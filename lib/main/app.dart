import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:starwars_app/src/routes/router.gr.dart';
import 'package:starwars_app/features/auth/presentation/state/auth_state.dart';
import 'package:starwars_app/features/auth/presentation/state/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final initializationProvider = FutureProvider<Unit>((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkIfAuthenticated();
  return unit;
});

class App extends ConsumerWidget {
  final appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (_, state) {});
    ref.listen<AuthState>(
      authNotifierProvider,
      (_, state) {
        state.maybeMap(
          orElse: () {},
          authenticated: (_) => appRouter.pushAndPopUntil(
            const MainRoute(),
            predicate: (route) => false,
          ),
          unauthenticated: (_) => appRouter.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          ),
          signedOut: (_) => appRouter.pushAndPopUntil(
            const SignInRoute(),
            predicate: (route) => false,
          ),
        );
      },
    );
    return MaterialApp.router(
      title: 'Q Flutter TDD',
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      debugShowCheckedModeBanner: false,
    );
  }
}