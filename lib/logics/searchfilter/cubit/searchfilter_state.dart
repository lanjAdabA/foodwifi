part of 'searchfilter_cubit.dart';

enum SearchFilterStatus { initial, loading, loaded, error }

class SearchfilterState extends Equatable {
  const SearchfilterState({this.searchfilterdata, required this.status});
  final SearchFilterModel? searchfilterdata;
  final SearchFilterStatus status;

  @override
  List<Object?> get props => [searchfilterdata, status];
}

// class SearchfilterInitial extends SearchfilterState {}
