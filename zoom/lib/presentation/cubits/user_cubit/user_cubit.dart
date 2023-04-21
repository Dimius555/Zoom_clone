import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom/data/interfaces/user_repository.dart';
import 'package:zoom/domain/models/app_user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  // Статические методы для прослушивания и получения кубита
  static UserState watchState(BuildContext context) => context.watch<UserCubit>().state;
  static UserCubit read(BuildContext context) => context.read<UserCubit>();

  final UserRepository _userRepository;

  UserCubit({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserState(user: AppUser.emptyUser()));

  void fetchUser() async {
    try {
      final user = await _userRepository.fetchUser();
      emit(UserState(user: user));
    } catch (e) {
      log(e.toString());
    }
  }
}
