import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LogInState extends Equatable {}

class LogInLoading extends LogInState {
  @override
  List<Object?> get props => [];
}

class LogInError extends LogInState {
  @override
  List<Object?> get props => [];
}

class LogInSuccess extends LogInState {
  final User? _user;

  LogInSuccess(this._user);

  @override
  List<User?> get props => [_user];
}

class AlreadyLoggedIn extends LogInState {
  final GoogleSignInAccount _currentUser;

  AlreadyLoggedIn(this._currentUser);

  @override
  List<Object?> get props => [_currentUser];
}