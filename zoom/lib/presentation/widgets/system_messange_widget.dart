import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom/utils/constants/enums.dart';

import 'app_snack_bar.dart';

class SystemMessageWidget extends StatefulWidget {
  final Widget child;

  const SystemMessageWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<SystemMessageWidget> createState() => _SystemMessageWidgetState();
}

class _SystemMessageWidgetState extends State<SystemMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SystemMessageCubit, SystemMessageState>(
      listener: (context, state) {
        showSnackBar(context, state.message, state.type);
      },
      builder: (context, state) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0, boldText: false),
          child: widget.child,
        );
      },
    );
  }
}

class SystemMessageState {
  final String message;
  final MessageType type;

  SystemMessageState({
    required this.message,
    required this.type,
  });
}

class SystemMessageCubit extends Cubit<SystemMessageState> {
  // Статические методы для прослушивания и получения кубита
  static SystemMessageState watchState(BuildContext context) => context.watch<SystemMessageCubit>().state;
  static SystemMessageCubit read(BuildContext context) => context.read<SystemMessageCubit>();

  SystemMessageCubit() : super(SystemMessageState(message: '', type: MessageType.info));

  void showInfoMessage(String text) {
    emit(SystemMessageState(message: text, type: MessageType.info));
  }

  void showErrorMessage(String text) {
    emit(SystemMessageState(message: text, type: MessageType.error));
  }

  void showSuccessMessage(String text) {
    emit(SystemMessageState(message: text, type: MessageType.successfulOperation));
  }
}

