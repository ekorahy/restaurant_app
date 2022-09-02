import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurant.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetail({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(restaurant.pictureId),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name),
                  Text(restaurant.city),
                  Text(restaurant.description),
                  const Divider(color: Colors.grey),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Menus'),
                  const Text('Foods :'),
                  Text(
                    '${restaurant.menus.foods.map((e) => e)}'
                  ),
                  const Text('Drinks :'),
                  Text(
                      '${restaurant.menus.drinks.map((e) => e)}'
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
