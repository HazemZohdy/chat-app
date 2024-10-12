import 'package:caht_appreview/constant.dart';
import 'package:caht_appreview/helper/helper.dart';
import 'package:caht_appreview/views/chat_view.dart';
import 'package:caht_appreview/views/cubits/login_cubit/register_cubit/register_cubit.dart';
import 'package:caht_appreview/widgets/custom_bottom.dart';
import 'package:caht_appreview/widgets/custom_text_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatelessWidget {
  String? email;
  String? password;
  static String id = 'RigesterView';
  bool isLoadin = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
         if (state is RegisterLoading) {
          isLoadin = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, ChatView.id);
          isLoadin = false;
        } else if (state is RegisterFaliure) {
          ShowSnakBar(context, state.errMessage);
          isLoadin = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoadin,
          child: Scaffold(
            backgroundColor: kPrimaryKey,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: formKey,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 100),
                    Image.asset(
                      klogo,
                      height: 100,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Scolar Chat',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 29,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 65),
                    const Row(
                      children: [
                        Text(
                          'Rigester',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    customTextFeild(
                      onChanged: (data) {
                        email = data;
                      },
                      hint: 'Email',
                    ),
                    const SizedBox(height: 15),
                    customTextFeild(
                      obscureText: true,
                      onChanged: (data) {
                        password = data;
                      },
                      hint: 'PassWord',
                    ),
                    const SizedBox(height: 15),
                    customBottom(
                      ontap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<RegisterCubit>(context)
                              .RigesterUser(email: email!, password: password!);
                        } else {}
                      },
                      bottom: 'Rigester',
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an acount? ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            '  Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> RigesterUser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
