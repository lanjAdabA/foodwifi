part of 'restaurant_list_cubit.dart';

class RestaurantListState extends Equatable {
  const RestaurantListState({this.restaurantListdata});
  final RestaurantListModel? restaurantListdata;

  @override
  List<Object?> get props => [restaurantListdata];
}

// class RestaurantListInitial extends RestaurantListState {}
