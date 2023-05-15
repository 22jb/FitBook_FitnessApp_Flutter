import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // LoginPage({super.key})

  final _controller = TextEditingController();
  final _passwordController = TextEditingController();
  // late TextEditingController password = TextEditingController();

  var accounts = {'': ''};

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String?> navStack = [];
    var navigatorState = Navigator.of(context);
    for (var object in navigatorState.widget.pages) {
      navStack.add(object.name);
    }

    print("Login Page Nav stack : ${navStack}");

    // print(contex)
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsetsDirectional.all(40),
          children: [
            TextField(
              controller: _controller,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              decoration: const InputDecoration(
                labelText: "Username",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                print("Login Button: ${ModalRoute.of(context)?.settings.name}");
                setState(() {
                  String username = _controller.text;
                  String password = _passwordController.text;
                  if (accounts.containsKey(username)) {
                    if (accounts[username] == password) {
                      print('correct password');

                      print(
                          "path before loging in: ${ModalRoute.of(context)?.settings.name}");
                      context.go("/home");
                      // initState();
                    } else {
                      print('incorrect password');
                    }
                    // print('good');
                  }
                });

                // context.go("/home");
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

// class builder(BuildContext context){

// }
