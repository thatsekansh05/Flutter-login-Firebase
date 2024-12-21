import 'package:flutter/material.dart';
import '../modules/auth_bloc.dart';
import 'auth_page.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await AuthBloc().signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AuthPage()),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Homepage!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
