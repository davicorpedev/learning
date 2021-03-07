import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/application/auth/auth_cubit.dart';
import 'package:learning_app/presentation/routes/routes.dart';

class UserDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName(homePageRoute));
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Log out"),
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).removeUser();
          },
        ),
      ),
    );
  }
}
