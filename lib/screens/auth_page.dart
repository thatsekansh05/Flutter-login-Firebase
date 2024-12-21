import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../modules/auth_bloc.dart';
import 'signup_page.dart';
import 'home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthBloc _authBloc = AuthBloc();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  String? errorMessage;
  //
  // void _signInUser() async {
  //   email = _emailController.text;
  //   password = _passwordController.text;
  //   if (email.isEmpty || password.isEmpty) {
  //     setState(() {
  //       errorMessage = "Email and Password cannot be empty!";
  //     });
  //     return;
  //   }
  //   String? result = await _authBloc.signIn(email: email, password: password);
  //
  //   if (result == null) {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const HomePage()),
  //     );
  //   } else {
  //     setState(() {
  //       errorMessage = result;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    String email = _emailController.text; // This is already a String
    String password = _passwordController.text; // This is already a String

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController ,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),


            const SizedBox(height: 10),
            if (errorMessage != null)
              Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            /*ElevatedButton(
              onPressed: () async {
               String? result =await _authBloc.signIn(email: _emailController.text, password: _passwordController.toString());
               if (result==null){
                 Navigator.pushReplacement(context,
                   MaterialPageRoute(builder: (context) => const HomePage() )
                 );
               }
               else{
                 setState(() {
                   errorMessage = result;
                 });
               }
              },

              child: const Text('Sign In'),
            ),*/

            ElevatedButton(
              onPressed: () async {
                try {
                  User? user = await _authBloc.signIn(
                    email: email,
                    password: password,
                  ); // Await the result of the sign-in call

                  if (user != null) {
                    // Sign-in successful, navigate to the HomePage
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else {
                    // Handle the case where the user object is null
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Sign-In failed. Please try again.')),
                    );
                  }
                } catch (e) {
                  // Handle any exceptions that occur during sign-in
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Sign-In Error: $e')),
                  );
                }
              },
              child: const Text('Login'),
            ),


            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text('Create New Account'),
            ),
          ],
        ),
      ),
    );
  }
}
