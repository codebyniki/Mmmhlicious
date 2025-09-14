import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../screens/homeScreen.dart';
import '../buttons/squareButton.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: SquareButton(
                imageUrl: 'assets/images/CookBook_3DIcon.png',
                title: 'Discover New Recipes',
                screen: HomeScreen(),
              )),
              SizedBox(width: 12),
              Expanded(child: SquareButton(
                imageUrl: 'assets/images/Planner_3DIcon.png',
                title: 'Plan Your Meals',
                screen: HomeScreen(),
              )),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: SquareButton(
                imageUrl: 'assets/images/ShoppingCart_3DIcon.png',
                title: 'Make A Shopping List',
                screen: HomeScreen(),
              )),
              SizedBox(width: 12),
              Expanded(child: SquareButton(
                imageUrl: 'assets/images/Favorites_3DIcon.png',
                title: 'Your\nFavorites',
                screen: HomeScreen(),
              )),
            ],
          ),
        ],
      ),
    );
  }

}