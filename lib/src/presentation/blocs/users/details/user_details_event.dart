part of 'user_details_bloc.dart';

sealed class UserDetailsEvent extends Equatable {
  const UserDetailsEvent();

  @override
  List<Object> get props => [];
}

class UserDetailLoadedEvent extends UserDetailsEvent {
  final String? fullName;

  const UserDetailLoadedEvent({
    this.fullName,
  });
}
