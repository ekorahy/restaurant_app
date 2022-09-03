import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurant.dart';
import 'package:restaurant_app/restaurant_detail.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:restaurant_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Restaurant App',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
        elevation: 0,
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
  return InkWell(
    child: Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                restaurant.pictureId,
                width: 100.0,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        restaurant.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14.0,
                            color: primaryColor,
                          ),
                          Text(
                            restaurant.city,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 14.0,
                          color: goldColor,
                        ),
                        Text(
                          restaurant.rating.toString(),
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: goldColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    onTap: () {
      Navigator.pushNamed(context, RestaurantDetail.routeName,
          arguments: restaurant);
    },
  );
}
