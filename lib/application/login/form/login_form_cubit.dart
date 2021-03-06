import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'login_form_state.dart';

const String FIELDS_FAILURE_MESSAGE = "Fields are not correct";

class LoginFormCubit extends Cubit<LoginFormState> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  LoginFormCubit() : super(LoginFormInitial());

  Future<void> validate() async {
    emit(LoginFormLoading());

    if (formKey.currentState!.validate()) {
      emit(LoginFormCorrect(email: email, password: password));
    } else {
      emit(LoginFormError(message: FIELDS_FAILURE_MESSAGE));
    }
  }
}
