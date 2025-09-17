import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/widgets/buttons/squareButton.dart';
import 'package:frontend/widgets/cards/recipeCard.dart';
import 'package:frontend/widgets/grids/homeGrid.dart';

import '../model/recipe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    Recipe communityFavorite = Recipe.create(
      id: 1,
      title: 'Sandwich with boiled egg',
      imageUrl: 'assets/images/food-placeholder.png',
      typeAndTags: [],
      details: 'No details further',
      ingredientsList: {},
      steps: [],
      cookingTime: 12,
      likes: 14352,
      comments: 456
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 60, bottom: 40),
        child: Center(
          child: SizedBox(
            width: size.width * 0.85,
            height: size.height - 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 140,
                  alignment: Alignment.topCenter,
                ),
                Text(
                  'Hey Max! Let’s get cooking!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                    fontSize: 22,
                    letterSpacing: -0.5,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Your kitchen adventures await. What’s on the menu today?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                      color: colorScheme.onSurface,
                      fontSize: 12,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                const HomeGrid(),
                const SizedBox(height: 10),
                Text(
                  'Today\'s Community Favorite',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                    fontSize: 16,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 10),
                RecipeCard(
                  recipe: communityFavorite,
                  wide: true,
                  icon: 'assets/images/FavoriteRecipeCard_3DIcon.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}