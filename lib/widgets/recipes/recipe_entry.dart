import 'package:flutter/material.dart';
import 'package:listeverywhere_app/constants.dart';
import 'package:listeverywhere_app/models/recipe_model.dart';

/// A single recipe card with information from [recipe]
class RecipeEntry extends StatelessWidget {
  const RecipeEntry({
    super.key,
    required this.recipe,
    this.enableActions = true,
    required this.deleteCallback,
    required this.updateCallback,
    this.listIdForMerge,
  });

  /// The recipe object
  final RecipeModel recipe;

  /// If edit/delete actions should be shown
  final bool enableActions;

  /// Callback for deleting
  final Function(int) deleteCallback;

  /// Callback for updating
  final Function(RecipeModel) updateCallback;

  /// If set, user is merging recipe with list
  final int? listIdForMerge;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: secondary,
        onTap: () {
          // display single recipe
          Navigator.pushNamed(context, '/recipes/recipe',
              arguments: RecipeViewModel(
                  recipeId: recipe.recipeId,
                  edit: false,
                  listId: listIdForMerge,
                  canEdit: enableActions));
        },
        child: SizedBox(
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(recipe.recipeName),
              ),
              // only show if actions are enabled
              if (enableActions)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        // update recipe
                        print('Updating recipe ID ${recipe.recipeId}');
                        updateCallback(recipe);
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        // delete recipe
                        print('Deleting recipe ID ${recipe.recipeId}');
                        deleteCallback(recipe.recipeId);
                      },
                      icon: const Icon(Icons.delete_forever),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
