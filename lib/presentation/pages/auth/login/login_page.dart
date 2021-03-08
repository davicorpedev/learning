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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<LoginFormCubit>(create: (_) => sl<LoginFormCubit>()),
          BlocProvider<LoginCubit>(create: (_) => sl<LoginCubit>()),
        ],
        child: BlocConsumer<LoginFormCubit, LoginFormState>(
          listener: (context, state) {
            if (state is LoginFormCorrect) {
              BlocProvider.of<LoginCubit>(context)
                  .login(state.email, state.password);
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
                  LoginButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
