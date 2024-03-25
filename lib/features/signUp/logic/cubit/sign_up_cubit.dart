import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/features/signUp/data/models/sign_up_request_body.dart';
import 'package:flutter_advanced_course/features/signUp/logic/cubit/sign_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_advanced_course/features/signUp/data/repos/sign_up_repo.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController passwordConfirmationController =
      TextEditingController();
  late TextEditingController genderController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void emitSignUpStates() async {
    emit(const SignUpState.signUpLoading());
    final response = await _signUpRepo.signUp(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (signUpRequestBody) {
        emit(SignUpState.signUpSuccess(signUpRequestBody));
      },
      failure: (error) {
        emit(SignUpState.signUpError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
