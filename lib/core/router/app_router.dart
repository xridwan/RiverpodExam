import 'package:go_router/go_router.dart';
import 'package:riverpod_exam/presentation/pages/character_detail_page.dart';

import '../../presentation/pages/character_page.dart';
import 'navigation_route.dart';

final GoRouter router = GoRouter(
  initialLocation: NavigationRoute.characterPage,
  routes: [
    GoRoute(
      name: 'characterPage',
      path: NavigationRoute.characterPage,
      builder: (context, state) => const CharacterPage(),
    ),
    GoRoute(
      name: 'characterDetailPage',
      path: NavigationRoute.characterDetailPage,
      builder: (context, state) {
        final id = state.extra as int;
        return CharacterDetailPage(id: id);
      },
    ),
  ],
);
