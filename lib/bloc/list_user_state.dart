import 'package:equatable/equatable.dart';
import 'package:users_pattern_bloc/model/user_model.dart';

abstract class ListUserState extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class ListUserInit extends ListUserState {}

class ListUserLoading extends ListUserState {}

class ListUserLoaded extends ListUserState {
  final List<User>? users;
  final bool? isDeletes;

  ListUserLoaded({this.users, this.isDeletes});
}

class ListUserError extends ListUserState {
  final error;

  ListUserError({this.error});
}
