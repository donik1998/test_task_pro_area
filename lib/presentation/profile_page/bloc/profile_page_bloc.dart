import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:new_test_stuff/domain/models/photo_model.dart';
import 'package:new_test_stuff/domain/remote/user_repository.dart';
import 'package:new_test_stuff/presentation/profile_page/bloc/profile_page_event.dart';
import 'package:new_test_stuff/presentation/profile_page/bloc/profile_page_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  List<PhotoModel> userLikedPhotos = List.empty(growable: true);

  ProfilePageBloc() : super(ProfilePageInitial()) {
    on<ProfilePageLoadUser>((event, emit) async {
      emit(ProfilePageLoading());
      final user = await UserService.instance.getUserData();
      user.fold((fail) => emit(ProfilePageError(failure: fail)), (profile) {
        emit(ProfilePageSuccess(user: profile));
        add(ProfilePageLoadLikedPhotos());
      });
    });

    on<ProfilePageLoadLikedPhotos>((event, emit) async {
      final sp = await SharedPreferences.getInstance();
      final photoIds = sp.getKeys();

      for (final id in photoIds) {
        print(sp.getString(id));
        print(id);
        userLikedPhotos.add(PhotoModel.fromJson(jsonDecode(sp.getString(id) ?? '')));
      }
    });
  }
}
