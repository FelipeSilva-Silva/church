import 'package:flutter/material.dart';
import 'package:igreja/src/components/sidebar/sidebar_component.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final userController = TextEditingController();
final passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(),
              ),
              const SizedBox(height: 20),
              const Text("Igreja Com Algum nome"),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: userController,
                          decoration: const InputDecoration(
                              hintText: "Usuário",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none))),
                      const SizedBox(height: 15),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Senha",
                          fillColor: Colors.white,
                          filled: true,
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const SideBarComponent(),
                          ));
                        },
                        child: const Text("ENTRAR"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
