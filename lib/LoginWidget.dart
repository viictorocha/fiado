import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(10, 80, 10, 10),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.account_circle_outlined),
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              controller: passwordController,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: ElevatedButton(
              child: const Text('Entrar'),
              onPressed: singIn,
            ),
          )
        ],
      ),
    );
  }

  Future singIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }
}
