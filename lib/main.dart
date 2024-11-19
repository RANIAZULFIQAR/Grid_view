import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveGrid(),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  final List<String> images = [
    'https://upload.wikimedia.org/wikipedia/commons/4/45/A_small_cup_of_coffee.JPG',
    'https://upload.wikimedia.org/wikipedia/commons/1/15/Recipe_logo.jpeg',
    'https://upload.wikimedia.org/wikipedia/commons/a/a3/Eq_it-na_pizza-margherita_sep2005_sml.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/4/47/Hamburger_%28black_bg%29.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/6/60/Sushi_platter.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/c/cb/Pineapple_and_cross_section.jpg',

  ];



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final int crossAxisCount = (screenWidth ~/ 150).clamp(2, 6); // Min 2, Max 6 columns

    return Scaffold(
      appBar: AppBar(
        title: const Text('*Responsive Grid*'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Image.network(
              images[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
