import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void logOut() async{
    emit(HomeLoading());
    FacebookAuth.instance.logOut().then((value) {
      emit(LogoutSuccess());
    });
  }
}
