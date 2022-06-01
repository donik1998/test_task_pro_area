import 'package:dartz/dartz.dart';
import 'package:new_test_stuff/data/api.dart';
import 'package:new_test_stuff/data/failure.dart';
import 'package:new_test_stuff/domain/models/photo_model.dart';

abstract class PhotosRepository {
  Future<Either<Failure, List<PhotoModel>>> getPhotos(int limit, int page);
}

class PhotoService extends PhotosRepository {
  PhotoService._();

  static PhotoService get instance => PhotoService._();

  @override
  Future<Either<Failure, List<PhotoModel>>> getPhotos(int limit, int page) async {
    return await Task<List<PhotoModel>>(
      () => ApiClient.instance.getPhotos(limit, page),
    )
        .attempt()
        .map(
          (either) => either.leftMap((err) => err as Failure),
        )
        .run();
  }
}
