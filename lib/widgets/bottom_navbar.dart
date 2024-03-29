import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listeverywhere_app/constants.dart';

/// A navigation bar for logged-in users to access lists and recipes
/// Temporarily a stateless widget until navigator is rewritten.
class BottomNavBar extends StatelessWidget {
  // Selected navigation item
  final int currentIndex;
  // Pages to navigate to
  final pages = [
    '/lists',
    '/recipes/user',
    '/recipes',
  ];
  // context of parent view
  final BuildContext parentContext;

  BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: primary,
      currentIndex: currentIndex,
      // list of navigation bar items
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.basketShopping),
          label: 'My Lists',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.listUl),
          label: 'My Recipes',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.magnifyingGlass),
          label: 'Find Recipes',
        ),
      ],
      onTap: (value) {
        // navigate to the route based on index
        Navigator.popAndPushNamed(parentContext, pages[value]);
      },
    );
  }
}

/*
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return BottomNavBarState();
  }
}

class BottomNavBarState extends State<BottomNavBar> {
  final pages = [
    '/lists',
    '/recipes/user',
    '/recipes/explore',
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.basketShopping),
            label: 'My Lists',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.listUl),
            label: 'My Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.magnifyingGlass),
            label: 'Find Recipes',
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
          Navigator.pushNamed(context, pages[index]);
        },
      ),
    );
  }
}
*/