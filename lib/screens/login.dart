import 'package:flutter/material.dart';
import 'package:schedule_app_fe/core/api/apiUtil.dart';
import 'package:schedule_app_fe/core/api/auth.api.dart';
import 'package:schedule_app_fe/core/form/TextField.dart';
import 'package:schedule_app_fe/screens/register.dart';
import 'package:schedule_app_fe/util/route.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSubmit() async {
    var response =
        await AuthApi.login(_usernameController.text, _passwordController.text);
    print(response);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: const FlutterLogo(
              size: 80,
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 25,
                          wordSpacing: 3,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    TextFieldC(
                      controller: _usernameController,
                      label: 'Username',
                      error: apiUtil.getErrorByField('username'),
                    ),
                    const SizedBox(height: 10),
                    TextFieldC(
                      controller: _passwordController,
                      label: 'Password',
                      error: apiUtil.getErrorByField('password'),
                      isPassword: true,
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          PageNavigator.rightToLeft(context, RegisterScreen());
                        },
                        child: Text('Register an account'),
                      ),
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                        onPressed: _onSubmit, child: const Text('Login')),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
