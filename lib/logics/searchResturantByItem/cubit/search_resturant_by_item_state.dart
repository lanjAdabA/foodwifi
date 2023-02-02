part of 'search_resturant_by_item_cubit.dart';

enum SearchStatus { initial, loading, loaded, error }

class SearchResturantByItemState extends Equatable {
  SearchResturantByItemState(
      {required this.status, required this.ResturantSearchByItem});
  final SearchStatus status;
  final List<ResturantSearchByItemModel> ResturantSearchByItem;

  @override
  List<Object> get props => [status];
}

// class SearchResturantByItemInitial extends SearchResturantByItemState {}
