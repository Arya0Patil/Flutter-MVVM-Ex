import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view_model/auth_viewModel.dart';

import '../resources/components/round_button.dart';
import '../utils/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePass = ValueNotifier(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passFocusNode.dispose();

    _obsecurePass.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 144, 250),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    decoration: const InputDecoration(
                        hintText: 'Email', prefixIcon: Icon(Icons.mail)),
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus(passFocusNode);
                    },
                  ),
                  ValueListenableBuilder(
                      valueListenable: _obsecurePass,
                      builder: (context, value, child) {
                        return TextFormField(
                          controller: _passwordController,
                          obscureText: _obsecurePass.value,
                          focusNode: passFocusNode,
                          decoration: InputDecoration(
                              suffix: IconButton(
                                  onPressed: () {
                                    _obsecurePass.value = !_obsecurePass.value;
                                  },
                                  icon: Icon(_obsecurePass.value
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.key)),
                        );
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  // ElevatedButton(onPressed: () {}, child: Text("Login"))
                  RoundButton(
                      title: "Login",
                      onPressed: () {
                        print("cicked");
                        Map data = {
                          'email': _emailController.text.toString(),
                          'password': _passwordController.text.toString()
                        };
                        authViewModel.loginApi(data, context);
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
