
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(StepGreenerApp());
}

class StepGreenerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StepGreener',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        // Navigate to home screen upon successful login
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')),
        );
      }
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'StepGreener',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                  validator: (value) => (value == null || !value.contains('@')) ? 'Enter a valid email' : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                  obscureText: true,
                  validator: (value) => (value == null || value.length < 6) ? 'Enter a valid password' : null,
                ),
                SizedBox(height: 20),
                _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _login,
                        child: Text('Login', style: TextStyle(fontSize: 18)),
                      ),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
