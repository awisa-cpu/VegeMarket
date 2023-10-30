import 'package:flutter/material.dart';
import 'package:shopcart/utilities/routes/routes_constants.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  late final TextEditingController _emailCon;
  late final TextEditingController _passwordCon;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _emailCon = TextEditingController();
    _passwordCon = TextEditingController();
  }

  @override
  void dispose() {
    _emailCon.dispose();
    _passwordCon.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.5),
          child: Column(
            children: [
              //
              const SizedBox(
                height: 200.5,
              ),

              //message
              const Text('Login To Your Account'),

              //
              const SizedBox(
                height: 25.5,
              ),

              //email field
              TextField(
                controller: _emailCon,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.5),
                    ),
                  ),
                ),
              ),
              //
              const SizedBox(
                height: 15.5,
              ),

              //password field
              TextField(
                controller: _passwordCon,
                obscureText: _showPassword,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10.5),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.5),
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),

              //
              const SizedBox(
                height: 20.5,
              ),
              const Text('Or Continue With'),

              const SizedBox(
                height: 10.5,
              ),

              //other sign in options
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 1.0,
                    child: Container(
                      width: 130,
                      height: 50,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'lib/images/facebook.png',
                            width: 20.5,
                            height: 20.5,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Facebook ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //
                  const SizedBox(
                    width: 18,
                  ),

                  //
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 1.0,
                    child: Container(
                      width: 130,
                      height: 50,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'lib/images/google.jpg',
                            width: 22.5,
                            height: 22.5,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'Google ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              //
              const SizedBox(
                height: 15.5,
              ),
              Text(
                'Forgot Your Password?',
                style: TextStyle(color: Colors.amber.shade900),
              ),

              const SizedBox(
                height: 10.5,
              ),

              //login button
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginPage, (route) => false);
                },
                child: Container(
                  width: 130,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.amber.shade900,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'Login ',
                    style: TextStyle(color: Colors.white),
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
