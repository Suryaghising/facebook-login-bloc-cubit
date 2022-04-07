import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/login/login_cubit.dart';
import '../../utils/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: TextButton(
                child: const Text('Login with Facebook'),
                onPressed: () {
                  // BlocProvider.of<LoginCubit>(context).loginWithGoogle();
                  BlocProvider.of<LoginCubit>(context).loginWithFacebook();
                },
              ),
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)));
                } else if(state is LoginSuccess) {
                  Navigator.pushNamed(context, HOME, arguments: state.profile);
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
