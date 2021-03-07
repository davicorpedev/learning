import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/login/form/login_form_cubit.dart';
import 'package:learning_app/application/login/login_cubit.dart';
import 'package:learning_app/injection_container.dart';
import 'package:learning_app/presentation/pages/auth/login/widgets/login_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final cubit = sl<LoginCubit>();

  late final TextEditingController emailController;
  late final TextEditingController passController;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();

    passController.dispose();
    emailController.dispose();
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
              cubit.login(state.email, state.password);
            }
          },
          builder: (context, state) {
            return Form(
              key: BlocProvider.of<LoginFormCubit>(context).formKey,
              child: Column(
                children: [
                  ListTile(
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
                  ),
                  ListTile(
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
                  ),
                  SizedBox(height: 16),
                  LoginButton(cubit: cubit),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
