import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginWithFacebook() async {

    emit(LoginLoading());
    try {
      final result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken!.token;
        final graphResponse = await http.get(Uri.parse(
            'https://graph.facebook.com/me?access_token=$accessToken&fields=id,name,picture,email'));
        final profile = jsonDecode(graphResponse.body);
        emit(LoginSuccess(profile: profile));
      } else {
        emit(LoginFailure(message: result.message!));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
