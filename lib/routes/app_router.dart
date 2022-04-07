import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home/home_cubit.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../utils/constants.dart';
import '../cubit/login/login_cubit.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROOT:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (BuildContext context) => LoginCubit(),
                child: const LoginScreen(),
              ),
        );

      case HOME:
        final profile = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => HomeCubit(),
              child: HomeScreen(profile: profile),
            ));
      default:
        return null;
    }
  }
}
