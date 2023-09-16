import 'package:flutter/material.dart';

class FoodCategoriesCard extends StatefulWidget {
  const FoodCategoriesCard({super.key});

  @override
  State<FoodCategoriesCard> createState() => _FoodCategoriesCardState();
}

class _FoodCategoriesCardState extends State<FoodCategoriesCard> {

  final List<Map<String, String>> categories = [
    {
      'name': 'Fruits',
      'image': 'https://plus.unsplash.com/premium_photo-1676047258590-8a8a2a583050?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2836&q=80'
    },
    {
      'name': 'Vegetables',
      'image': 'https://images.unsplash.com/photo-1546793665-c74683f339c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80'
    },
    {
      'name': 'Dairy',
      'image': 'https://images.unsplash.com/photo-1505576633757-0ac1084af824?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=800&q=60'
    },
    {
      'name': 'Meat',
      'image': 'https://images.unsplash.com/photo-1543161252-42609aa0e3d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=800&q=60'
    },
    {
      'name': 'Fish',
      'image': 'https://images.unsplash.com/photo-1522251253478-4cae03d93949?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=800&q=60'
    },
    {
      'name': 'Grains',
      'image': 'https://images.unsplash.com/photo-1683207911146-0eee69f3a619?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEzfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=800&q=60'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(child: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(categories[index]['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Text(categories[index]['name']!),
            ],
          ),
        );
      },
    ));

  }
}
