import 'package:ali_mohamed_task/modules/login_screen.dart';
import 'package:ali_mohamed_task/shared/classes/applocal.dart';
import 'package:ali_mohamed_task/shared/components/components.dart';
import 'package:ali_mohamed_task/shared/cubit/app_cubit.dart';
import 'package:ali_mohamed_task/shared/states/app_states.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

class UserData extends StatelessWidget {
  final String? name;
  final String? email;
  final String? phone;

  UserData(this.name, this.email, this.phone);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return BlocProvider(
        create: (context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('${getLang(context, 'userData')}'),
                backgroundColor: const Color(0xFF005DA3),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText('${getLang(context, 'fullName')} : ',
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xFF005DA3))),
                        AutoSizeText(
                          name!,
                          style: const TextStyle(
                              fontSize: 20, color: Color(0xFF005DA3)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText('${getLang(context, 'email')} : ',
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xFF005DA3))),
                        AutoSizeText(
                          email!,
                          style: const TextStyle(
                              fontSize: 20, color: Color(0xFF005DA3)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText('${getLang(context, 'phone')} : ',
                            style: const TextStyle(
                                fontSize: 20, color: Color(0xFF005DA3))),
                        AutoSizeText(
                          phone!,
                          style: const TextStyle(
                              fontSize: 20, color: Color(0xFF005DA3)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Container(
                    width: 30.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                        color: const Color(0xFFAD002F),
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: MaterialButton(
                      onPressed: () {
                        navigateAndFinish(context, LoginScreen());
                      },
                      child: AutoSizeText(
                        '${getLang(context, 'logout')}',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
