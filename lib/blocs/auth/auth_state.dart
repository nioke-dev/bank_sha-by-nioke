part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthFailed extends AuthState {
  final String e;
  const AuthFailed(this.e);

  @override
  List<Object> get props => [e];
}

class AuthCheckEmailSuccess extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;
  final bool shouldNavigate;
  const AuthSuccess(this.user, {this.shouldNavigate = true});

  @override
  List<Object> get props => [user];
}
