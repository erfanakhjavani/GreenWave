

import 'package:flutter/material.dart';

class SplashDescriptionWidget extends StatelessWidget {
  const SplashDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        description,
        style: const TextStyle(color: Colors.white,
        fontSize: 14
        ),
        textAlign: TextAlign.center,),
    );



  }
}


String description = '''
Nature GreenLink is a global initiative dedicated to fostering a deeper connection between humanity and the environment.

Our mission is to build a sustainable future by encouraging individuals, communities, and organizations worldwide to take actionable steps in preserving the planet. Through innovative programs, collaborative projects, and global challenges, we aim to inspire a greener lifestyle and promote environmental awareness. At Nature GreenLink,

we believe in the power of collective action to bring about lasting change for the Earth.
''';
