import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: () => print('Button clicked'),
        style: ElevatedButton.styleFrom(
          fixedSize:  Size(size.width * 0.85, 60),
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: colorScheme.onSecondary
              ),
            ),
            const SizedBox(width: 10),
            Icon(
              icon,
              color: colorScheme.onSecondary,
              size: 24,
            )
          ],
        ),
    );
  }

}