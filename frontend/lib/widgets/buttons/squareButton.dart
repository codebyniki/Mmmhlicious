import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SquareButton extends StatelessWidget {
  final String imageUrl; // e.g. 'assets/images/logo.svg'
  final String title;
  final Widget screen;

  const SquareButton({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => screen),
      ),
      child: Container(
        width: 153,
        height: 160,
        alignment: Alignment.topLeft, // ⬅ makes intent explicit
        padding: const EdgeInsets.all(16), // ⬅ space from edges
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: colorScheme.onSecondary,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start, // ⬅ left-align children
          children: [
            Image.asset(imageUrl, width: 66, height: 66),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.left, // (not strictly needed, but explicit)
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
                fontSize: 16,
                letterSpacing: -0.5,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
