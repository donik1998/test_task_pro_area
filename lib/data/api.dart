import 'package:dio/dio.dart';
import 'package:new_test_stuff/domain/models/collection_mode.dart';
import 'package:new_test_stuff/domain/models/photo_model.dart';
import 'package:new_test_stuff/domain/models/user_model.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://api.unsplash.com')
abstract class ApiClient {
  static ApiClient get instance => _ApiClient(_dio);

  static final Dio _dio = Dio()
    ..options = BaseOptions(headers: {
      'Authorization': 'Bearer ZRHxnIivHcQYT_Gllyr7M781Ru8G_LpPf4DGk1Yaz3w'
    }, queryParameters: {
      'client_id': '8cWs0_kY_1MXaQKtWXIE1SK4eNZXodLMty5R64OdQVE',
    })
    ..interceptors.add(LogInterceptor());

  @GET('/photos')
  Future<List<PhotoModel>> getPhotos(
    @Header('x-per-page') int limit,
    @Query('page') int page,
  );

  @GET('/me')
  Future<UserModel> getUserProfile();
}
