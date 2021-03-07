import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/login/form/login_form_cubit.dart';

class PassTextField extends StatefulWidget {
  @override
  _PassTextFieldState createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  final TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    passController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: passController,
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
