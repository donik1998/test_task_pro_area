import 'dart:convert';

import 'package:new_test_stuff/domain/models/photo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataRepository {
  Future<bool> isPhotoLiked(String id);
  Future<void> likePhoto(PhotoModel photo);
  Future<void> dislikePhoto(String photoId);
}

class LocalDataService implements LocalDataRepository {
  LocalDataService._();

  static LocalDataService get instance => LocalDataService._();

  @override
  Future<bool> isPhotoLiked(String id) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    return sp.containsKey(id);
  }

  @override
  Future<void> likePhoto(PhotoModel photo) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString(photo.id ?? '', jsonEncode(photo.copyWith(isLiked: true).toJson()));
  }

  @override
  Future<void> dislikePhoto(String photoId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(photoId);
  }
}
