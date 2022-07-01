import 'package:ali_mohamed_task/modules/login_screen.dart';
import 'package:ali_mohamed_task/shared/classes/applocal.dart';
import 'package:ali_mohamed_task/shared/components/components.dart';
import 'package:ali_mohamed_task/shared/cubit/app_cubit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../shared/states/app_states.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKry = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF005DA3),
      statusBarBrightness: Brightness.light,
    ));

    return Sizer(builder: (context, orientation, deviceType) {
      return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Color(0xFF005DA3),
              body: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                            height: 26.h,
                            width: 40.w,
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/logo.png')),
                      ],
                    ),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(3.h),
                            topRight: Radius.circular(3.h)),
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKry,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 6.h,
                              ),
                              SizedBox(
                                height: 6.5.h,
                                width: 75.w,
                                child: defaultTextFormFiled(
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return '${getLang(context, 'validation')}';
                                      }
                                      return null;
                                    },
                                    labelText:
                                        '${getLang(context, "fullName")}',
                                    controller: nameController,
                                    textInputType: TextInputType.emailAddress),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 6.5.h,
                                width: 75.w,
                                child: defaultTextFormFiled(
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return '${getLang(context, 'validation')}';
                                      }
                                      return null;
                                    },
                                    labelText: '${getLang(context, 'email')}',
                                    controller: emailController,
                                    textInputType: TextInputType.emailAddress),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 6.5.h,
                                width: 75.w,
                                child: defaultTextFormFiled(
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return '${getLang(context, 'validation')}';
                                      }
                                      return null;
                                    },
                                    labelText: '${getLang(context, 'phone')}',
                                    controller: phoneController,
                                    textInputType: TextInputType.emailAddress),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 6.5.h,
                                width: 75.w,
                                child: defaultTextFormFiled(
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return '${getLang(context, 'validation')}';
                                      }
                                      return null;
                                    },
                                    showPassword: () {
                                      AppCubit.get(context).changePassword();
                                    },
                                    isPassword:
                                        AppCubit.get(context).showPassword,
                                    labelText:
                                        '${getLang(context, "password")}',
                                    controller: passwordController,
                                    textInputType: TextInputType.emailAddress,
                                    suffix: AppCubit.get(context).icon),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 6.5.h,
                                width: 75.w,
                                child: defaultTextFormFiled(
                                    showPassword: () {
                                      AppCubit.get(context).changePassword();
                                    },
                                    isPassword:
                                        AppCubit.get(context).showPassword,
                                    labelText:
                                        '${getLang(context, 'confirmPassword')}',
                                    controller: confirmPasswordController,
                                    textInputType: TextInputType.emailAddress,
                                    suffix: AppCubit.get(context).icon),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 30.w,
                                      height: 6.h,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF005DA3),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  10)),
                                      child: MaterialButton(
                                        onPressed: () {
                                          AppCubit.get(context).userRegister(
                                              context: context,
                                              email: emailController.text,
                                              password: passwordController.text,
                                              name: nameController.text,
                                              phone: phoneController.text);
                                          if (formKry.currentState!
                                              .validate()) {
                                            if (confirmPasswordController
                                                    .text ==
                                                phoneController.text) {}
                                          }
                                        },
                                        child: AutoSizeText(
                                          '${getLang(context, 'register')}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 30.w,
                                      height: 6.h,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF005DA3),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  10)),
                                      child: MaterialButton(
                                        onPressed: () {
                                          navigateTo(context, LoginScreen());
                                        },
                                        child: AutoSizeText(
                                          '${getLang(context, 'login')}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
