part of 'item_detailed_cubit.dart';

enum Status { initial, loading, loaded, error }

class ItemDetailedState extends Equatable {
  const ItemDetailedState({required this.status, this.productdetail});
  final ProductDetailModel? productdetail;
  final Status status;

  @override
  List<Object?> get props => [status, productdetail];
}




// class DetailState extends Equatable {
//   const DetailState({required this.status, this.productdetail});
//   final ProductDetailModel? productdetail;

//   @override
//   List<Object?> get props => [productdetail];
// }
