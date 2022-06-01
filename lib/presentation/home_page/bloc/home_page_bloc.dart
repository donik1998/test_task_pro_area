import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_test_stuff/domain/local/liked_photo_repository.dart';
import 'package:new_test_stuff/domain/models/photo_model.dart';
import 'package:new_test_stuff/domain/remote/photos_repository.dart';
import 'package:new_test_stuff/presentation/home_page/bloc/home_page_event.dart';
import 'package:new_test_stuff/presentation/home_page/bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final ScrollController scrollController = ScrollController();
  List<PhotoModel> allPhotos = List.empty(growable: true);

  bool isLoading = false;

  int pageCounter = 1;

  HomePageBloc() : super(HomePageInitial()) {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent - scrollController.offset < 50 && !isLoading) {
        add(HomePageLoadMorePhotos(limit: 10, page: pageCounter + 1));
      }
    });
    on<HomePageLoadMorePhotos>((event, emit) async {
      isLoading = true;
      final result = await PhotoService.instance.getPhotos(event.limit, event.page);
      await result.fold(
        (failure) {
          emit(HomePageError(error: failure));
        },
        (photos) async {
          for (int i = 0; i < photos.length; i++) {
            final isLiked = await LocalDataService.instance.isPhotoLiked(photos.elementAt(i).id ?? '');
            if (isLiked) {
              photos[i] = photos.elementAt(i).copyWith(isLiked: true);
            } else {
              photos[i] = photos.elementAt(i).copyWith(isLiked: false);
            }
          }
          pageCounter = event.page;
          allPhotos.addAll(photos);
          isLoading = false;
          emit(HomePageNewPhotos(photos: photos));
        },
      );
    });
    on<HomePageLikePhotoEvent>((event, emit) async {
      await LocalDataService.instance.likePhoto(event.photo);
    });
    on<HomePageDislikePhotoEvent>((event, emit) async {
      await LocalDataService.instance.dislikePhoto(event.photoId);
    });
    on<HomePageLoadPhotos>((event, emit) async {
      emit(HomePageLoading());
      final result = await PhotoService.instance.getPhotos(event.limit, event.page);
      await result.fold(
        (failure) {
          emit(HomePageError(error: failure));
        },
        (photos) async {
          for (int i = 0; i < photos.length; i++) {
            final isLiked = await LocalDataService.instance.isPhotoLiked(photos.elementAt(i).id ?? '');
            if (isLiked) {
              photos[i] = photos.elementAt(i).copyWith(isLiked: true);
            } else {
              photos[i] = photos.elementAt(i).copyWith(isLiked: false);
            }
          }
          pageCounter = event.page;
          allPhotos.addAll(photos);
          emit(HomePageSuccess(
            photos: photos,
            currentLimit: event.limit,
            currentPage: event.page,
          ));
        },
      );
    });
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
