import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/login/form/login_form_cubit.dart';
import 'package:learning_app/application/login/login_cubit.dart';
import 'package:learning_app/injection_container.dart';
import 'package:learning_app/presentation/pages/auth/login/widgets/email_text_field.dart';
import 'package:learning_app/presentation/pages/auth/login/widgets/login_button.dart';
import 'package:learning_app/presentation/pages/auth/login/widgets/password_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginCubit = sl<LoginCubit>();

  @override
  void dispose() {
    loginCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: BlocProvider<LoginFormCubit>(
        create: (_) => LoginFormCubit(),
        child: BlocConsumer<LoginFormCubit, LoginFormState>(
          listener: (_, state) {
            if (state is LoginFormCorrect) {
              loginCubit.login(state.email, state.password);
            }
          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<LoginFormCubit>(context).formKey,
              child: Column(
                children: [
                  EmailTextField(),
                  PasswordTextField(),
                  SizedBox(height: 16),
                  LoginButton(cubit: loginCubit),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
