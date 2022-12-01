import 'package:flutter/material.dart';
import 'package:starwars_app/features/flexitarian/presentation/pages/state/provider/flexi_recipes_state.dart';
import 'package:starwars_app/features/vegan/presentation/widgets/circular_loading_widget.dart';
import 'package:starwars_app/src/providers/providers.dart';
import 'package:starwars_app/src/ui/colors.dart';
import 'package:starwars_app/src/utils/favorite_alerting_extension.dart';
import 'package:starwars_app/features/vegan/presentation/widgets/recipes_list_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FlexiterianPage extends StatelessWidget {
  const FlexiterianPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: _FlexiterianRecipesBody(),
    );
  }
}

class _FlexiterianRecipesBody extends ConsumerWidget {
  const _FlexiterianRecipesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.favoriteStateListener(context);
    return RefreshIndicator(
      color: AppColors.lightestGreen,
      onRefresh: () =>
          ref.read(flexiRecipesNotifierProvider.notifier).loadRecipes(),
      child: ref.watch<FlexiRecipesState>(flexiRecipesNotifierProvider).when(
          initial: () => const CircularLoader(),
          loading: () => const CircularLoader(),
          loaded: (recipes) => RecipesListWidget(
                recipes: recipes,
              ),
          error: (error) => Center(child: Text(error))),
    );
  }
}