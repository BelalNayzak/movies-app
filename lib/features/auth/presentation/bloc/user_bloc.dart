import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mina_pharma_task_movie/features/auth/domain/usecases/logout_usecase/logout_usecase.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/strings/strings.dart';
import '../../domain/entity/user.dart';
import '../../domain/usecases/login_usecase/login_usecase.dart';
import '../../domain/usecases/signup_usecase/signup_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  LoginUsecase loginUsecase;
  LogoutUsecase logoutUsecase;
  SignupUsecase signupUsecase;

  UserBloc({
    required this.loginUsecase,
    required this.logoutUsecase,
    required this.signupUsecase,
  }) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is ChangeScreenToSignupEvent) {
        emit(SignupScreenState());
      } else if (event is ChangeScreenToLoginEvent) {
        emit(LoginScreenState());
      } else if (event is LoginEvent) {
        emit(AuthLoadingState());
        final eitherLoginOrFail = await loginUsecase.call(event.user);
        eitherLoginOrFail.fold(
          (l_fail) {
            emit(NotAuthedState(
              errorMessage: _mapFailureToErrorMessage(l_fail),
            ));
          },
          (r_unit) {
            emit(AuthedState());
          },
        );
      } else if (event is SignupEvent) {
        emit(AuthLoadingState());
        final eitherSignupOrFail = await signupUsecase.call(event.user);
        eitherSignupOrFail.fold(
          (l_fail) {
            emit(NotAuthedState(
              errorMessage: _mapFailureToErrorMessage(l_fail),
            ));
          },
          (r_unit) {
            emit(AuthedState());
          },
        );
      } else if (event is LogoutEvent) {
        emit(AuthLoadingState());
        await logoutUsecase.call();
        emit(AuthOutState());
      }
    });
  }

  String _mapFailureToErrorMessage(Failure f) {
    switch (f.runtimeType) {
      case NotRegisteredFailure:
        return 'Not registered. Please sign up';
      case AlreadyRegisteredFailure:
        return 'Already registered. Please log in';
      case WrongPassFailure:
        return 'Wrong password!';
      default:
        return UNEXPECTED_ERROR;
    }
  }
}
