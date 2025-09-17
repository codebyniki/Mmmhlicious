import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/model/recipe.dart';
import 'package:frontend/widgets/details.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final String icon;
  final bool wide;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.wide,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (!wide) throw UnimplementedError('TODO'); // Explore site

    return ClipRRect(
      borderRadius: BorderRadius.circular(35),
      child: SizedBox(
        height: 206,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              recipe.imageUrl,
              fit: BoxFit.cover,
            ),

            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x0073503D),
                    Color(0x855D3F2F),
                    Color(0xFF3A261B),
                  ],
                  stops: [0.0, 0.68, 1.0],
                ),
              ),
            ),

            Positioned(
              top: 16,
              right: 16,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: 56,
                        height: 56,
                        color: const Color(0x38BABABA),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 56,
                    height: 56,
                    child: Image.asset(
                      icon,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 230,
                    child: Text(
                      recipe.title,
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFFFFF3EB),
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DetailsWidget(
                        icon: Icon(IconsaxPlusBold.clock,
                            color: colorScheme.primary, size: 8),
                        text: '${recipe.cookingTime} min',
                      ),
                      DetailsWidget(
                        icon: Icon(IconsaxPlusBold.profile_2user,
                            color: colorScheme.primary, size: 8),
                        text: 'Loved by ${recipe.likes} cooks',
                      ),
                      DetailsWidget(
                        icon: Icon(IconsaxPlusBold.messages_3,
                            color: colorScheme.primary, size: 8),
                        text: '${recipe.comments} comments',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
