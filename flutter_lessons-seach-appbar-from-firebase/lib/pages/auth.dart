import 'package:flutter/material.dart';
import 'package:flutter_lessons/auth/service.dart';
import 'package:flutter_lessons/components/authorization_input.dart';
import 'package:flutter_lessons/components/margin.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isRegister = false;
  final AuthServices _service = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future signIn() async {
    var user =
        await _service.signIn(_emailController.text, _passwordController.text);
  }

  Future signUp() async {
    var user = await _service.register(
        _emailController.text, _passwordController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var iconColor = Theme.of(context).hintColor;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('MonkeyApp',
                      style: TextStyle(color: primaryColor, fontSize: 30)),
                  Image.asset('images/monkey.png'),
                ],
              ),
              const AuthorizationMargin(
                heightScale: 0.05,
              ),
              AuthorizationInput(
                _emailController,
                color: primaryColor,
                icon: Icon(Icons.email, color: iconColor),
                labelText: 'Email',
              ),
              const AuthorizationMargin(),
              AuthorizationInput(
                _passwordController,
                color: primaryColor,
                icon: Icon(Icons.email, color: iconColor),
                labelText: 'Password',
              ),
              const AuthorizationMargin(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor: MaterialStatePropertyAll(primaryColor),
                  ),
                  onPressed: () {
                    _isRegister ? signUp() : signIn();
                  },
                  child: Text(_isRegister ? 'Register' : 'Sign in'),
                ),
              ),
              const AuthorizationMargin(),
              InkWell(
                child: Text(
                  _isRegister ? 'Sign in?' : "Sign up?",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _isRegister = !_isRegister;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/iphone');
                },
                child: const Text('Go see Iphone page'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/iphone-grid');
                },
                child: const Text('Go see Iphone grid page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
