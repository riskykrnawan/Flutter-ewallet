import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:etam_wallet/models/signin_form_model.dart';
import 'package:etam_wallet/models/signup_form_model.dart';
import 'package:etam_wallet/models/user_model.dart';
import 'package:etam_wallet/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          
          emit(AuthLoading());

          final res = await AuthService().checkEmail(event.email);

          if (!res) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email sudah dipakai'));
          }

        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final user = await AuthService().register(event.data);
          emit(AuthSuccess(user));
          
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final user = await AuthService().login(event.data);
          emit(AuthSuccess(user));
          
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

    });
  }
}
