import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/login/login.dart';
import '../../../store/login/log_in_bloc.dart';

import 'signin.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  eventCalling(BuildContext context, String username, String password) async {
    BlocProvider.of<LogInBloc>(context).add(LoginRequested(
        context: context, username: username, password: password));
    String accesstoken = await getAccessToken().toString();
    log(accesstoken);
  }

  late String _email;
  late String _password;
  var emailController;
  bool _obscureText = true;
  var username = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: 90,
                width: MediaQuery.of(context).size.width * .85,
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email/Username",
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  validator: (val) =>
                      val!.isEmpty ? 'Username cannot be empty' : null,
                  onSaved: (val) => _email = val!,
                  onChanged: (value) => username = value,
                ),
              ),
              Container(
                height: 90,
                width: MediaQuery.of(context).size.width * .85,
                child: TextFormField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder()),
                  validator: (val) =>
                      val!.isEmpty ? 'Password cannot be empty' : null,
                  onSaved: (val) => _password = val!,
                  onChanged: (value) => password = value,
                ),
              ),
              BlocProvider<LogInBloc>(
                  create: (BuildContext context) => LogInBloc(),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .85,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffFFBE00)),
                        onPressed: () async {
                          final form = formKey.currentState;
                          if (form!.validate()) {
                            await eventCalling(context, username, password);
                          }
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                  )),
              const Expanded(child: Signin())
            ],
          ),
        ),
      )),
    );
  }
}
