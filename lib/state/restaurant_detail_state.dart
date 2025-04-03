import 'package:restaurant_app/data/model/restaurant_detail_response.dart';

sealed class RestaurantDetailState {}

class RestaurantDetailInitial extends RestaurantDetailState {}

class RestaurantDetailLoading extends RestaurantDetailState {}

class RestaurantDetailLoaded extends RestaurantDetailState {
  final RestaurantDetail restaurantDetail;
  RestaurantDetailLoaded(this.restaurantDetail);
}

class RestaurantDetailError extends RestaurantDetailState {
  final String message;
  RestaurantDetailError(this.message);
}
