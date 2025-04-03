import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_services.dart';
import 'package:restaurant_app/state/restaurant_detail_state.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiServices apiServices;

  RestaurantDetailProvider({ApiServices? apiServices})
      : apiServices = apiServices ?? ApiServices();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  RestaurantDetailState _state = RestaurantDetailInitial();
  RestaurantDetailState get state => _state;
  set state(RestaurantDetailState value) {
    _state = value;
    notifyListeners();
  }

  Future<void> fetchRestaurantDetail(String id) async {
    isLoading = true;
    state = RestaurantDetailLoading();
    try {
      final response = await apiServices.getRestaurantDetail(id);
      state = RestaurantDetailLoaded(response.restaurant);
    } catch (e) {
      state = RestaurantDetailError(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
