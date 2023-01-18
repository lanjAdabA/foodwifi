part of 'fetch_data_cubit.dart';

class FetchDataState extends Equatable {
  const FetchDataState({required this.alldata, required this.firstlistitem});
  final List<Foodwifimodel> alldata;

  final List<List<Item?>> firstlistitem;

  @override
  List<Object> get props => [];
}

// class FetchDataInitial extends FetchDataState {}
