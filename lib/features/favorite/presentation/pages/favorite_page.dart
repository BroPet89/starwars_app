import 'package:flutter/material.dart';
import 'package:starwars_app/features/vegan/presentation/widgets/circular_loading_widget.dart';
import 'package:starwars_app/src/providers/providers.dart';
import 'package:starwars_app/features/favorite/presentation/state/favorite_list_state.dart';
import 'package:starwars_app/features/favorite/presentation/widgets/filter_radio_button.dart';
import 'package:starwars_app/features/vegan/presentation/widgets/recipes_list_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: CustomScrollView(physics: ClampingScrollPhysics(), slivers: [
        _FavoritesList(),
      ]),
    );
  }
}

class _FavoritesList extends ConsumerWidget {
  const _FavoritesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(filteredFavoritesListProvider);
    return SliverToBoxAdapter(
      child: Column(
        children: [
          if (recipes.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(
                top: 8.0,
              ),
              child: FilterRadioButton(),
            ),
          ref.watch<FavoriteListState>(favoriteListNotifierProvider).maybeMap(
                orElse: () => Container(),
                initial: (_) => Container(),
                empty: (_) => SizedBox(
                  height: MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      kBottomNavigationBarHeight -
                      kToolbarHeight,
                  child: const Center(
                    child: Text("You haven't added anything to favorites"),
                  ),
                ),
                loaded: (_) => RecipesListWidget(
                  disableScroll: true,
                  recipes: recipes,
                ),
                loading: (_) => const CircularLoader(),
              ),
        ],
      ),
    );
  }
}