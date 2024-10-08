import 'dart:async';

import 'package:sha_bank/models/sign_in_form_model.dart';
import 'package:sha_bank/models/sign_up_form_model.dart';
import 'package:sha_bank/models/user_edit_form_model.dart';
import 'package:sha_bank/models/user_model.dart';
import 'package:sha_bank/services/auth_service.dart';
import 'package:sha_bank/services/user_service.dart';
import 'package:sha_bank/services/wallet_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthState? _previousState;
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());

          final res = await AuthService().checkEmail(event.email);

          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email Sudah Terpakai'));
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

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SignInFormModel data =
              await AuthService().getCredentialFromLocal();

          final UserModel user = await AuthService().login(data);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogout) {
        try {
          emit(AuthLoading());
          await AuthService().logout();
          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            final updatedUser = (state as AuthSuccess).user.copyWith(
                  username: event.data.username,
                  name: event.data.name,
                  email: event.data.email,
                  password: event.data.password,
                );
            emit(AuthLoading());
            await UserService().updateUser(event.data);
            emit(AuthSuccess(updatedUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthUpdatePin) {
        try {
          if (state is AuthSuccess) {
            final updatedPin =
                (state as AuthSuccess).user.copyWith(pin: event.newPin);
            _previousState = state;
            emit(AuthLoading());
            await WalletService().updatePin(event.oldPin, event.newPin);
            emit(AuthSuccess(updatedPin));
          } else {}
        } catch (e) {
          emit(AuthFailed(e.toString()));
          // Emit event untuk mengembalikan state setelah beberapa waktu
          Future.delayed(const Duration(seconds: 2), () {
            add(AuthRestoreState());
          });
        }
      }

      if (event is AuthRestoreState) {
        if (_previousState != null) {
          emit(AuthSuccess((_previousState as AuthSuccess).user,
              shouldNavigate: false)); // Kembalikan state sebelumnya
        }
      }

      if (event is AuthUpdateBalance) {
        if (state is AuthSuccess) {
          final currentUser = (state as AuthSuccess).user;
          final updatedUser = currentUser.copyWith(
            balance: currentUser.balance! + event.amount,
          );

          emit(AuthSuccess(updatedUser));
        }
      }
    });
  }
}
