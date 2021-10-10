import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginState extends Equatable {}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginError extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final User? _user;

  LoginSuccess(this._user);

  @override
  List<User?> get props => [_user];
}

class AlreadyLoggedIn extends LoginState {
  final GoogleSignInAccount _currentUser;

  AlreadyLoggedIn(this._currentUser);

  @override
  List<Object?> get props => [_currentUser];
}