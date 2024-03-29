import 'package:flutter/material.dart';
import 'package:listeverywhere_app/constants.dart';
import 'package:listeverywhere_app/models/category_model.dart';
import 'package:listeverywhere_app/models/item_model.dart';
import 'package:listeverywhere_app/models/list_model.dart';
import 'package:listeverywhere_app/models/recipe_model.dart';
import 'package:listeverywhere_app/models/search_model.dart';
import 'package:listeverywhere_app/models/user_model.dart';
import 'package:listeverywhere_app/views/lists/select_list_for_match.dart';
import 'package:listeverywhere_app/views/lists/select_list_items_for_match.dart';
import 'package:listeverywhere_app/views/recipes/create_recipe.dart';
import 'package:listeverywhere_app/views/recipes/select_recipe_for_match.dart';
import 'package:listeverywhere_app/widgets/bottom_navbar.dart';
import 'package:listeverywhere_app/views/recipes/category_recipes.dart';
import 'package:listeverywhere_app/views/recipes/explore_recipes.dart';
import 'package:listeverywhere_app/views/home.dart';
import 'package:listeverywhere_app/views/login.dart';
import 'package:listeverywhere_app/views/lists/my_lists.dart';
import 'package:listeverywhere_app/views/recipes/my_recipes.dart';
import 'package:listeverywhere_app/views/recipes/recipe_categories.dart';
import 'package:listeverywhere_app/views/register.dart';
import 'package:listeverywhere_app/views/recipes/search_recipes.dart';
import 'package:listeverywhere_app/views/recipes/search_recipes_results.dart';
import 'package:listeverywhere_app/views/lists/single_list.dart';
import 'package:listeverywhere_app/views/recipes/single_recipe.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  /*
  runApp(ChangeNotifierProvider(
    create: (context) => UserModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        dateOfBirth: dateOfBirth,
        username: username,
        password: password),
    child: const MyApp(),
  ));
  */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ListEverywhere',
        theme: ThemeData(
            primaryColor: primary,
            appBarTheme: const AppBarTheme(color: primary)),
        initialRoute: '/welcome',
        routes: {
          //'/': (context) => BottomNavBar(),
          '/welcome': (context) => HomeView(),
          '/register': (context) => RegisterView(),
          '/login': (context) => LoginView(),
          '/lists': (context) => const MyListsView(),
          '/lists/list': (context) => SingleListView(
              listId: ModalRoute.of(context)?.settings.arguments as int),
          '/recipes/user': (context) => const MyRecipesView(),
          '/recipes/recipe': (context) => SingleRecipeView(
                recipeInit: ModalRoute.of(context)?.settings.arguments
                    as RecipeViewModel,
              ),
          '/recipes': (context) => const ExploreRecipes(),
          '/recipes/categories': (context) => const RecipeCategoriesView(),
          '/recipes/categories/category': (context) => CategoryRecipesView(
                category:
                    ModalRoute.of(context)?.settings.arguments as CategoryModel,
              ),
          '/recipes/create': (context) => const CreateRecipeView(),
          '/recipes/edit': (context) => CreateRecipeView(
                recipe:
                    ModalRoute.of(context)?.settings.arguments as RecipeModel,
              ),
          '/recipes/search': (context) => const SearchRecipesView(),
          '/recipes/search/results': (context) => SearchRecipesResultsView(
                search:
                    ModalRoute.of(context)?.settings.arguments as SearchModel,
              ),
          '/recipes/list-select': (context) => const SelectListForMatchView(),
          '/recipes/list-select/item-select': (context) =>
              SelectListItemsForMatchView(
                listItemsInit: ModalRoute.of(context)?.settings.arguments
                    as ListMatchModel,
              ),
          '/recipes/list-select/item-select/results': (context) =>
              SelectRecipeForMatchView(
                listItemIdsInit: ModalRoute.of(context)?.settings.arguments
                    as RecipeMatchModel,
              ),
          '/recipes/list-select-merge': (context) => SelectListForMatchView(
                recipeId: ModalRoute.of(context)?.settings.arguments as int,
              )
        });
  }
}
