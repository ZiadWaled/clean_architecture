import 'package:clean_architecture/app/di.dart';
import 'package:clean_architecture/presentation/register/cubit/register_cubit.dart';
import 'package:clean_architecture/presentation/resources/assets_manager.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../cubit/register_states.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.white,
        iconTheme: IconThemeData(color: ColorManager.primary),
      ),
      body: BlocProvider(
        create: (context) => RegesterCubit(instance()),
        child: BlocBuilder<RegesterCubit, RegesterStates>(
          builder: (context, state){
            final registerCubit = BlocProvider.of<RegesterCubit>(context);
            return Container(
              padding: const EdgeInsets.only(top: AppPadding.p8),
              child: SingleChildScrollView(
                child: Form(
                  key: registerCubit.formKey,
                  // auto validate Mode: Auto validate Mode.always,
                  child: Column(
                    children: [
                      const Center(
                        child: Image(image: AssetImage(ImageAssets.splashLogo)),
                      ),
                      const SizedBox(
                        height: AppSize.s20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppPadding.p28,
                          right: AppPadding.p28,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: registerCubit.userNameEditingController,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            hintText: AppStrings.userName,
                            labelText: AppStrings.userName,
                          ),
                          validator:registerCubit.validateEmail,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: AppPadding.p28,
                            right: AppPadding.p28,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: registerCubit.phoneEditingController,
                                  decoration: const InputDecoration(
                                    hintText: AppStrings.phone,
                                    labelText: AppStrings.phone,
                                  ),

                                  validator: registerCubit.validatePhoneNumber,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),

                      //Reqular Expression to check email
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppPadding.p28,
                          right: AppPadding.p28,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: registerCubit.emailEditingController,
                          decoration: const InputDecoration(
                            hintText: AppStrings.email,
                            labelText: AppStrings.email,
                          ),
                          validator: registerCubit.validateEmail,
                        ),),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppPadding.p28,
                          right: AppPadding.p28,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: registerCubit.passwordEditingController,
                          decoration: const InputDecoration(
                            hintText: AppStrings.password,
                            labelText: AppStrings.password,
                          ),
                          validator: registerCubit.validatePassword,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: AppPadding.p28,
                          right: AppPadding.p28,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: AppSize.s40,
                          child: ElevatedButton(
                            // onPressed:  registerCubit.areAllInputsValid() ?? false
                            //     ? () {
                            //   registerCubit.register();
                            // }
                            //     : null,
                            onPressed: () {
                              registerCubit.register(context);
                            },
                            child: const Text(AppStrings.password),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s18,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
