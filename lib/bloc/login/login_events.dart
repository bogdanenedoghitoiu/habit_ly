import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class SignIn extends LoginEvent {
  final String _emailAddress;
  final String _password;

  SignIn(this._emailAddress, this._password);

  @override
  List<String> get props => [this._emailAddress, this._password];
}

class GoogleLogin extends LoginEvent {
  @override
  List<Object?> get props => [];
}
