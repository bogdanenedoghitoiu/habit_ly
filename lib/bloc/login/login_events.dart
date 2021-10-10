import 'package:equatable/equatable.dart';

abstract class LogInEvent extends Equatable {}

class SignIn extends LogInEvent {
  final String _emailAddress;
  final String _password;

  SignIn(this._emailAddress, this._password);

  @override
  List<String> get props => [this._emailAddress, this._password];
}

class GoogleLogin extends LogInEvent {
  @override
  List<Object?> get props => [];
}
