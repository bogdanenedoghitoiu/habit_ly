import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_ly/bloc/login/login_events.dart';
import 'package:habit_ly/bloc/login/login_states.dart';
import 'package:habit_ly/data/repositories/firebase_auth_repository.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  final FirebaseAuthRepository _authRepository;

  LogInBloc(this._authRepository) : super(LogInLoading());

  @override
  Stream<LogInState> mapEventToState(LogInEvent event) async* {
    switch (event.runtimeType) {
      case SignIn:
        final signInEvent = event as SignIn;

        final signInCredentials = signInEvent.props;
        final user = await _authRepository.signIn(
            signInCredentials[0], signInCredentials[1]);

        yield LogInSuccess(user);
        break;
      case AlreadyLoggedIn:
      default:
        break;
    }
  }
}
