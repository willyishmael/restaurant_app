import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/state/restaurant_list_state.dart';

class RestaurantListProvider extends ChangeNotifier {
  final ApiServices apiServices;

  RestaurantListProvider({ApiServices? apiServices})
      : apiServices = apiServices ?? ApiServices();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  RestaurantListState _state = RestaurantListInitial();
  RestaurantListState get state => _state;
  set state(RestaurantListState value) {
    _state = value;
    notifyListeners();
  }

  Future<void> fetchRestaurantList() async {
    isLoading = true;
    state = RestaurantListLoading();
    try {
      final response = await apiServices.getRestaurantList();
      if (response.restaurants.isEmpty) {
        state = RestaurantListEmpty();
      } else {
        state = RestaurantListLoaded(response.restaurants);
      }
    } catch (e) {
      state = RestaurantListError(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
