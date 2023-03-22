import 'package:flutter/material.dart';
import 'package:travel_buddy/utils/custom_text_style.dart';

import '../widgets/custom_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Home Page',
            style: CustomTextStyle.displayMedium,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchableList()),
              );
            },
            child: Text('Search'),
          ),
        ],
      ),
    );
  }
}
