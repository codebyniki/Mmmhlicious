import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/widgets/buttons/squareButton.dart';
import 'package:frontend/widgets/grids/homeGrid.dart';

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

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 315,
              maxHeight: size.height - 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 140,
                  alignment: Alignment.topCenter,
                ),
                Text(
                  'Hey Max! Let\’s get cooking!',
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
                  width: 250,
                  child: Text(
                    'Your kitchen adventures await. What\’s on the menu today?',
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    'Today\'s Community Favorite',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                      fontSize: 16,
                      letterSpacing: -0.5
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}