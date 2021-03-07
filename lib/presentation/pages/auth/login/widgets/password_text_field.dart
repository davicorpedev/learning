import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/login/form/login_form_cubit.dart';

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(labelText: "Password"),
        validator: (value) {
          if (value!.isEmpty) return "Add password";
        },
        onChanged: (val) {
          BlocProvider.of<LoginFormCubit>(context).password = val;
        },
      ),
    );
  }
}
