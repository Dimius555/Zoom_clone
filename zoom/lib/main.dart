import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom/config/router/routes.dart';
import 'package:zoom/presentation/widgets/system_messange_widget.dart';

import 'config/theme/app_theme.dart';
import 'firebase_options.dart';
import 'locator.dart';
import 'presentation/cubits/auth_cubit/auth_cubit.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/widgets/loading_widget.dart';
import 'utils/constants/enums.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initServiceLocator();
  await sl.allReady();
  runApp(const CubitsSetup());
}

class CubitsSetup extends StatelessWidget {
  const CubitsSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (_) => SystemMessageCubit(),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => AuthCubit(
            api: sl(),
            systemMessageCubit: SystemMessageCubit.read(_),
          )..checkAuthorisation(),
        ),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authState = AuthCubit.watchState(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      themeMode: ThemeMode.dark,
      theme: appTheme,
      routes: {
        routeLogin: (context) => const LoginScreen(),
        routeHome: (context) => const HomeScreen(),
      },
      home: SystemMessageWidget(
          child: authState.status == AuthStatus.signin
              ? const HomeScreen()
              : authState.status == AuthStatus.signout
                  ? const LoginScreen()
                  : const LoadingWidget()),
    );
  }
}
