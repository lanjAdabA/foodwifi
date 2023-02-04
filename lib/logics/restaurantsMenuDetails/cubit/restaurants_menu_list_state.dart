part of 'restaurants_menu_list_cubit.dart';

enum Status2 { initial, loading, loaded, error }

class RestaurantsMenuListState extends Equatable {
  const RestaurantsMenuListState(
      {required this.allbelowitems,
      required this.orialldata,
      required this.vegdata,
      required this.oneitem,
      required this.status,
      required this.alldata});
  final List<RestaurantsDetailsModel?> alldata;
  final List<RestaurantsDetailsModel?> orialldata;
  final List<ReviewModalModified> vegdata;
  final List<RestaurantsDetailsModel> oneitem;
  final List<ReviewModalModified> allbelowitems;
  final Status2 status;

  @override
  List<Object> get props =>
      [alldata, vegdata, oneitem, orialldata, allbelowitems];
}

// class RestaurantsMenuListInitial extends RestaurantsMenuListState {}
