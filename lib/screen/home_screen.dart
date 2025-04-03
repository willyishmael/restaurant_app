import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/state/restaurant_list_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<RestaurantListProvider>().fetchRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant List'),
      ),
      body: Consumer<RestaurantListProvider>(
        builder: (context, provider, child) {
          return switch (provider.state) {
            RestaurantListInitial() =>
              const Center(child: Text('Initial State')),
            RestaurantListLoading() =>
              const Center(child: CircularProgressIndicator()),
            RestaurantListLoaded loaded => ListView.builder(
                itemCount: loaded.restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = loaded.restaurants[index];
                  return ListTile(
                    title: Text(restaurant.name),
                    subtitle: Text(restaurant.city),
                    onTap: () {
                      // Navigate to detail screen
                    },
                  );
                },
              ),
            RestaurantListEmpty() =>
              const Center(child: Text('No Restaurants Found')),
            RestaurantListError error => Center(child: Text(error.message)),
          };
        },
      ),
    );
  }
}
