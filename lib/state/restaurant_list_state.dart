import 'package:restaurant_app/data/model/restaurant_list_response.dart';

sealed class RestaurantListState {}

class RestaurantListInitial extends RestaurantListState {}

class RestaurantListLoading extends RestaurantListState {}

class RestaurantListLoaded extends RestaurantListState {
  final List<RestaurantThumbnail> restaurants;
  RestaurantListLoaded(this.restaurants);
}

class RestaurantListError extends RestaurantListState {
  final String message;
  RestaurantListError(this.message);
}

class RestaurantListEmpty extends RestaurantListState {}
