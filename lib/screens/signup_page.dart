import 'package:flutter/material.dart';
import '../modules/auth_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthBloc _authBloc = AuthBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage;

  // void _signUpUser() async {
  //   final email = _emailController.toString();
  //   final password = _passwordController.toString();
  //
  //   if (email.isEmpty || password.isEmpty) {
  //     setState(() {
  //       errorMessage = "Both email and password fields are required!";
  //     });
  //     return;
  //   }
  //
  //   String? result = await _authBloc.signUp(email:email, password:password);
  //
  //   if (result == null) {
  //     Navigator.pop(context);  // Sign-up successful
  //   } else {
  //     setState(() {
  //       errorMessage = result;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 10),
            if (errorMessage != null)
              Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ElevatedButton(
              onPressed: () async {
              String? result = await _authBloc.signUp(email: _emailController.text , password: _passwordController.text);
    if (result == null) {
        Navigator.pop(context);  // Sign-up successful
       } else {
         setState(() {
           errorMessage = result;
         });
       }
     },


              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
