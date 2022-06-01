import 'package:new_test_stuff/data/failure.dart';
import 'package:new_test_stuff/domain/models/photo_model.dart';

abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageNewPhotos extends HomePageState {
  final List<PhotoModel> photos;

  HomePageNewPhotos({required this.photos});
}

class HomePageSuccess extends HomePageState {
  final List<PhotoModel> photos;
  final int currentPage;
  final int currentLimit;

  HomePageSuccess({
    required this.photos,
    required this.currentPage,
    required this.currentLimit,
  });
}

class HomePageError extends HomePageState {
  final Failure error;

  HomePageError({required this.error});
}
