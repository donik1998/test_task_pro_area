import 'package:new_test_stuff/data/failure.dart';
import 'package:new_test_stuff/domain/models/user_model.dart';

abstract class ProfilePageState {}

class ProfilePageInitial extends ProfilePageState {}

class ProfilePageLoading extends ProfilePageState {}

class ProfilePageSuccess extends ProfilePageState {
  final UserModel user;

  ProfilePageSuccess({required this.user});
}

class ProfilePageError extends ProfilePageState {
  final Failure failure;

  ProfilePageError({required this.failure});
}
