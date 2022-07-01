import 'package:ali_mohamed_task/models/user_model.dart';
import 'package:ali_mohamed_task/modules/user_data.dart';
import 'package:ali_mohamed_task/shared/components/components.dart';
import 'package:ali_mohamed_task/shared/states/app_states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  bool showPassword = true;
  IconData icon = Icons.visibility;

  void changePassword() {
    showPassword = !showPassword;
    if (showPassword) {
      icon = Icons.visibility;
    } else {
      icon = Icons.visibility_off;
    }
    emit(LoginChangePasswordState());
  }

  void userRegister(
      {required String email,
      required String password,
      required String name,
      required String phone,
      context}) {
    emit(RegisterLoadingStates());
    DioHelper.postData(url: 'register', data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone
    }).then((value) {
      Map<String, dynamic> statusTest = value.data;

      if (statusTest['status'] == 200) {
        userLogin(email: email, password: password, context: context);
      } else {
        showToast(message: statusTest['message'], states: ToastStates.ERROR);
      }
      emit(RegisterSuccessStates());
    }).catchError((error) {
      emit(RegisterErrorStates());
    });
  }

  UserModel? userModel;
  void userLogin({required String email, required String password, context}) {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: 'login',
        data: {'email': email, 'password': password}).then((value) {
      Map<String, dynamic> statusTest = value.data;
      if (statusTest['status'] == 200) {
        userModel = UserModel.fromJson(value.data);
        navigateTo(
            context,
            UserData(userModel!.account![0].name, userModel!.account![0].email,
                userModel!.account![0].phone));
      } else {
        showToast(message: statusTest['message'], states: ToastStates.ERROR);
      }
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState());
    });
  }
}
