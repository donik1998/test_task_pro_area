import 'package:new_test_stuff/domain/models/photo_model.dart';

abstract class HomePageEvent {}

class HomePageLoadMorePhotos extends HomePageEvent {
  final int limit;
  final int page;

  HomePageLoadMorePhotos({
    required this.limit,
    required this.page,
  });
}

class HomePageLikePhotoEvent extends HomePageEvent {
  final PhotoModel photo;

  HomePageLikePhotoEvent({required this.photo});
}

class HomePageDislikePhotoEvent extends HomePageEvent {
  final String photoId;

  HomePageDislikePhotoEvent({required this.photoId});
}

class HomePageLoadPhotos extends HomePageEvent {
  final int limit;
  final int page;

  HomePageLoadPhotos({
    required this.limit,
    required this.page,
  });
}
