import 'package:auto_route/auto_route.dart';
import 'package:starwars_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:starwars_app/features/favorite/presentation/pages/favorite_page.dart';
import 'package:starwars_app/features/flexitarian/presentation/pages/flexitarian_page.dart';
import 'package:starwars_app/features/main_page.dart';
import 'package:starwars_app/features/splash/presentation/pages/splash_page.dart';
import 'package:starwars_app/features/vegan/presentation/pages/recipe_details_page.dart';
import 'package:starwars_app/features/vegan/presentation/pages/vegan_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: MainPage, children: [
      MaterialRoute(page: FlexiterianPage),
      MaterialRoute(page: FavoritePage),
      MaterialRoute(page: VeganPage)
    ]),
    MaterialRoute(page: RecipeDetailsPage)
  ],
)
class $AppRouter {}