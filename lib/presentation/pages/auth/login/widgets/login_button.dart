import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/auth/auth_cubit.dart';
import 'package:learning_app/application/login/form/login_form_cubit.dart';
import 'package:learning_app/application/login/login_cubit.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (_, state) {
        if (state is LoginCorrect) {
          BlocProvider.of<AuthCubit>(context).saveUser(state.authUser);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return CircularProgressIndicator();
        }

        return ElevatedButton(
          onPressed: () {
            BlocProvider.of<LoginFormCubit>(context).validate();
          },
          child: Text("Sign in"),
        );
      },
    );
  }
}
