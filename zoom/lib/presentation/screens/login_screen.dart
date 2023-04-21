import 'package:flutter/material.dart';
import 'package:zoom/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:zoom/presentation/widgets/custom_button.dart';
import 'package:zoom/presentation/widgets/loading_widget.dart';
import 'package:zoom/utils/constants/enums.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = AuthCubit.watchState(context);

    return Scaffold(
      body: authState.status == AuthStatus.signout
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Start or join new meeting!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Image.asset('assets/images/onboarding.jpg'),
                ),
                CustomButton(
                  title: 'Google Sign In',
                  onPressed: () {
                    AuthCubit.read(context).signIn();
                  },
                )
              ],
            )
          : const LoadingWidget(),
    );
  }
}
