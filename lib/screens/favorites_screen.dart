import 'package:flutter/material.dart';

import '../utils/custom_text_style.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites Page',
        style: CustomTextStyle.displayMedium,
      ),
    );
  }
}
