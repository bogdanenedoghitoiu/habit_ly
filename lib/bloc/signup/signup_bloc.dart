import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/bloc/signup/signup_events.dart';
import 'package:habit_ly/bloc/signup/signup_states.dart';
import 'package:habit_ly/data/repositories/firebase_auth_repository.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final FirebaseAuthRepository _authRepository;

  SignUpBloc(this._authRepository) : super(SignUpLoading());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    switch (event.runtimeType) {
      case SignUp:
        final signUpEvent = event as SignUp;

        final signUpCredentials = signUpEvent.props;
        final user = await _authRepository.signUp(
            signUpCredentials[0], signUpCredentials[1]);

        yield SignUpSuccess(user);
        break;
      case GenerateSignUpScreen:
      default:
        yield SignUpLoaded();
        break;
    }
  }
}
