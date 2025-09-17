import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/widgets/buttons/primaryButton.dart';
import 'package:frontend/widgets/buttons/squareButton.dart';
import 'package:frontend/widgets/cards/recipeCard.dart';
import 'package:frontend/widgets/grids/homeGrid.dart';
import 'package:frontend/widgets/navigation/navbar.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../model/recipe.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final insets = MediaQuery.of(context).padding;
    final colorScheme = Theme.of(context).colorScheme;

    final communityFavorite = Recipe.create(
      id: 1,
      title: 'Sandwich with boiled egg',
      imageUrl: 'assets/images/food-placeholder.png',
      typeAndTags: [],
      details: 'No details further',
      ingredientsList: {},
      steps: [],
      cookingTime: 12,
      likes: 14352,
      comments: 456,
    );

    // Pad bottom a bit so content doesn't hide behind the bar
    const contentBottom = 24.0;

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 16, bottom: contentBottom + insets.bottom),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width * 0.85),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/logo.svg', width: 140),
                Text(
                  'Hey Max! Let\'s get cooking!',
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
                    'Your kitchen adventures await. What\'s on the menu today?',
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
                const SizedBox(height: 20),
                const PrimaryButton(text: 'Recipes by Country', icon: IconsaxPlusBold.direct_right),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}