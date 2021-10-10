import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {}

class SignUp extends SignUpEvent {
  final String _emailAddress;
  final String _password;

  SignUp(this._emailAddress, this._password);

  @override
  List<String> get props => [this._emailAddress, this._password];
}

class GenerateSignUpScreen extends SignUpEvent {
  @override
  List<Object?> get props => [];
}