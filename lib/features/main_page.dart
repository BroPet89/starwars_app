import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:starwars_app/src/routes/router.gr.dart';
import 'package:starwars_app/src/ui/colors.dart';
import 'package:starwars_app/features/vegan/presentation/widgets/app_bar_widget.dart';

import 'auth/presentation/state/providers.dart';

class MainPage extends ConsumerWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) => RecipesAppBar(
        [
          IconButton(
            onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      routes: const [
        FlexiterianRoute(),
        VeganRoute(),
        FavoriteRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.middleGreen,
          unselectedItemColor: AppColors.darkestGreen,
          showUnselectedLabels: true,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) => tabsRouter.setActiveIndex(index),
          items: _getTabItems(tabsRouter.activeIndex, context),
        );
      },
    );
  }
}

List<BottomNavigationBarItem> _getTabItems(
    int activeIndex, BuildContext context) {
  return [
    const BottomNavigationBarItem(
      icon: Icon(Icons.restaurant_rounded),
      label: 'Flexitarian',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.restaurant_menu),
      label: 'Vegan',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favorite',
    ),
  ];
}