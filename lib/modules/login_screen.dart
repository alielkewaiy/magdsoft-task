import 'package:ali_mohamed_task/modules/register_screen.dart';
import 'package:ali_mohamed_task/modules/user_data.dart';
import 'package:ali_mohamed_task/shared/classes/applocal.dart';
import 'package:ali_mohamed_task/shared/components/components.dart';
import 'package:ali_mohamed_task/shared/cubit/app_cubit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../shared/states/app_states.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
          listener: (context, state) {
            if (state is LoginSuccessState) {}
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: const Color(0xFF005DA3),
              body: SafeArea(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                            height: 26.h,
                            width: 40.w,
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/logo.png')),
                        Column(
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.h),
                              child: Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Container(
                                  height: 4.5.h,
                                  width: 23.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              1.h)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: .5.h),
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: AutoSizeText(
                                          '${getLang(context, 'langBtn')}',
                                          maxLines: 1,
                                          style: const TextStyle(
                                            color: Color(0xFF005DA3),
                                            fontSize: 18,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 18.h,
                            ),
                            SizedBox(
                              height: 6.5.h,
                              width: 75.w,
                              child: defaultTextFormFiled(
                                  labelText: '${getLang(context, 'email')}',
                                  controller: emailController,
                                  textInputType: TextInputType.emailAddress),
                            ),
                            const SizedBox(
                              height: 18,
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
                                  labelText: '${getLang(context, 'password')}',
                                  controller: passwordController,
                                  textInputType: TextInputType.emailAddress,
                                  suffix: AppCubit.get(context).icon),
                            ),
                            SizedBox(
                              height: 18.h,
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
                                        navigateTo(context, RegisterScreen());
                                      },
                                      child: AutoSizeText(
                                        '${getLang(context, 'register')}',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
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
                                        AppCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            context: context);
                                      },
                                      child: AutoSizeText(
                                        '${getLang(context, 'login')}',
                                        style: const TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
