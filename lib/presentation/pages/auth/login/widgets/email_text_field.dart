import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/login/form/login_form_cubit.dart';

class EmailTextField extends StatefulWidget {
  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: emailController,
        decoration: InputDecoration(labelText: "Email"),
        validator: (value) {
          if (value!.isEmpty) return "Add email";
        },
        onChanged: (val) {
          BlocProvider.of<LoginFormCubit>(context).email = val;
        },
      ),
    );
  }
}
