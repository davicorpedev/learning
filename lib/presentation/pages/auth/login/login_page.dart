import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/auth/auth_cubit.dart';
import 'package:learning_app/application/login/login_cubit.dart';
import 'package:learning_app/domain/repositories/user/user_repository.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final cubit = LoginCubit(userRepository: UserRepository());

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
      body: Form(
        key: formKey,
        child: Column(
          children: [
            ListTile(
              title: TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value!.isEmpty) return "Add email";
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
              ),
            ),
            SizedBox(height: 16),
            BlocConsumer<LoginCubit, LoginState>(
              bloc: cubit,
              listener: (_, state) {
                if (state is LoginCorrect) {
                  BlocProvider.of<AuthCubit>(context).saveUser(state.authUser);
                } else if (state is LoginFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (_, state) {
                if (state is LoginLoading) {
                  return CircularProgressIndicator();
                }

                return ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit.login(emailController.text, passController.text);
                    }
                  },
                  child: Text("Sign in"),
                );
              },
            ),
            /*TextButton(
              onPressed: () {
                Navigator.pushNamed(context, registerPageRoute);
              },
              child: Text("Sign up"),
            ),*/
          ],
        ),
      ),
    );
  }
}
