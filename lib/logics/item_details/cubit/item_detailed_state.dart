part of 'item_detailed_cubit.dart';

class ItemDetailedState extends Equatable {
  const ItemDetailedState({this.productdetail});
  final ProductDetailModel? productdetail;

  @override
  List<Object?> get props => [productdetail];
}




// class DetailState extends Equatable {
//   const DetailState({required this.status, this.productdetail});
//   final ProductDetailModel? productdetail;

//   @override
//   List<Object?> get props => [productdetail];
// }
