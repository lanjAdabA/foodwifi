part of 'all_reviews_cubit.dart';

class AllReviewsState extends Equatable {
  const AllReviewsState({required this.position, this.allreviews});
  final AllReviewsModel? allreviews;
  final bool position;

  @override
  List<Object?> get props => [allreviews, position];
}

// class AllReviewsInitial extends AllReviewsState {}
