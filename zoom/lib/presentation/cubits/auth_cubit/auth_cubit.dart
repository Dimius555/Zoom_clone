import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom/data/data_sources/remote/auth_api.dart';
import 'package:zoom/presentation/widgets/system_messange_widget.dart';
import 'package:zoom/utils/constants/enums.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // Статические методы для прослушивания и получения кубита
  static AuthState watchState(BuildContext context) => context.watch<AuthCubit>().state;
  static AuthCubit read(BuildContext context) => context.read<AuthCubit>();

  AuthCubit({required AuthAPI api, required SystemMessageCubit systemMessageCubit})
      : _api = api,
        _systemMessageCubit = systemMessageCubit,
        super(AuthState(status: AuthStatus.waiting));

  final SystemMessageCubit _systemMessageCubit;
  final AuthAPI _api;

  void checkAuthorisation() async {
    final result = _api.checkAuthorisation();
    if (result) {
      emit(state.copyWith(status: AuthStatus.signin));
    } else {
      emit(state.copyWith(status: AuthStatus.signout));
    }
  }

  void signIn() async {
    try {
      await _api.signInWithGoogle();
      _systemMessageCubit.showSuccessMessage('Signed in sucessfully!');
      emit(state.copyWith(status: AuthStatus.signin));
    } on FirebaseAuthException catch (e) {
      _systemMessageCubit.showErrorMessage(e.message!);
      emit(state.copyWith(status: AuthStatus.signout));
    }
  }

  void signOut() {
    emit(state.copyWith(status: AuthStatus.waiting));
    _api.signOut();
    _systemMessageCubit.showSuccessMessage('Signed out sucessfully!');
    emit(state.copyWith(status: AuthStatus.signout));
  }
}
