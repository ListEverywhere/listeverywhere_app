import 'package:flutter/material.dart';
import 'package:listeverywhere_app/models/item_model.dart';

/// ListView containing numbered entries for each recipe item in [items]
class RecipeItemList extends StatelessWidget {
  const RecipeItemList({
    super.key,
    required this.items,
    required this.deleteCallback,
    required this.updateCallback,
    this.edit = true,
  });

  /// List of recipe items
  final List<RecipeItemModel> items;

  /// Callback for deleting
  final Function(int) deleteCallback;

  /// Callback for editing
  final Function(RecipeItemModel) updateCallback;

  /// Enable editing
  final bool edit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            // create number index Text at start of ListTile
            leading: Text(
              '${index + 1}.',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            title: Text(items[index].itemName),
            trailing: edit
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          // update recipe
                          updateCallback(items[index]);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          // delete recipe
                          deleteCallback(items[index].recipeItemId);
                        },
                        icon: const Icon(Icons.delete_forever),
                      ),
                    ],
                  )
                : null,
          ),
        );
      },
    );
  }
}
