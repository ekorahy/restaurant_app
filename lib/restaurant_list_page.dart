import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurant.dart';
import 'package:restaurant_app/restaurant_detail.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class RestaurantListPage extends StatefulWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4)).then((value) => {
      FlutterNativeSplash.remove()
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: FutureBuilder<String>(
        future:
          DefaultAssetBundle.of(context).loadString('assets/data/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurant = parseRestaurants(snapshot.data);
          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(context, restaurant[index]);
            },
          );
        },
      ),
    );
  }
}

Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
  return ListTile(
    contentPadding:
      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    leading: Image.network(
      restaurant.pictureId,
      width: 100,
    ),
    title: Text(restaurant.name),
    subtitle: Text(restaurant.city),
    onTap: () {
      Navigator.pushNamed(context, RestaurantDetail.routeName,
      arguments: restaurant);
    },
  );
}
