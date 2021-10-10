import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpState extends Equatable {}

class SignUpSuccess extends SignUpState {
  final User? _user;

  SignUpSuccess(this._user);

  @override
  List<User?> get props => [_user];
}

class SignUpError extends SignUpState {
  final String _errorMessage;

  SignUpError(this._errorMessage);

  @override
  List<String> get props => [_errorMessage];
}

class SignUpLoading extends SignUpState {
  @override
  List<Object?> get props => [];
}

class SignUpLoaded extends SignUpState {
  @override
  List<Object?> get props => [];

}