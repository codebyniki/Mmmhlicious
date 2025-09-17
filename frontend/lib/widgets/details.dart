import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  final Icon icon;
  final String text;

  const DetailsWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 10,
            letterSpacing: -0.5,
            color: colorScheme.surface,
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
