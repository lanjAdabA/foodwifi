part of 'search_resturant_by_item_cubit.dart';

enum SearchStatus { initial, loading, loaded, error }

class SearchResturantByItemState extends Equatable {
  SearchResturantByItemState({
    required this.status,
    required this.isloading,
    required this.searchdata,
  });
  final SearchStatus status;
  final List<ResturantSearchByItemModel> searchdata;
  final bool isloading;

  @override
  List<Object> get props => [status, searchdata];
}

// class SearchResturantByItemInitial extends SearchResturantByItemState {}
