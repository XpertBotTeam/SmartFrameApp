import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  bool locked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 104, 208, 161),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _usernameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "username is required";
                      }
                      return null;
                    },
                    cursorColor: const Color.fromARGB(255, 104, 208, 161),
                    decoration: InputDecoration(
                      hintText: 'Enter an username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 104, 208, 161),
                        ),
                      ),
                    ),
                  ),
              const SizedBox(height: 10),
              TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        } else if (!emailRegExp.hasMatch(value)) {
                          return "Email is invalid";
                        } else {
                          return null;
                        }
                      },
                    cursorColor: const Color.fromARGB(255, 104, 208, 161),
                    decoration: InputDecoration(
                      hintText: 'Enter an Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 104, 208, 161),
                        ),
                      ),
                    ),
                  ),
              const SizedBox(height: 10),
              TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone Number is required";
                      }
                      return null;
                    },
                    cursorColor: const Color.fromARGB(255, 104, 208, 161),
                    decoration: InputDecoration(
                      hintText: 'Enter a Phone Number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 104, 208, 161),
                        ),
                      ),
                    ),
                  ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: locked,
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  } else if (value.length < 5) {
                    return "Password must be at least 5 char..";
                  }
                  return null;
                },
                cursorColor: const Color.fromARGB(255, 104, 208, 161),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(locked ? Icons.lock : Icons.lock_open),
                    color: const Color.fromARGB(255, 104, 208, 161),
                    onPressed: () {
                      setState(() {
                        locked = !locked;
                      });
                    },
                  ),
                  hintText: 'Enter a Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 104, 208, 161)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: locked,
                controller: _confirmPasswordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  } else if (_passwordController.text != value) {
                    return "Password does not match";
                  }
                  return null;
                },
                cursorColor: const Color.fromARGB(255, 104, 208, 161),
                decoration: InputDecoration(
                  // suffixIcon: IconButton(
                  //   icon: Icon(locked ? Icons.lock : Icons.lock_open),
                  //   color: const Color.fromARGB(255, 104, 208, 161),
                  //   onPressed: () {
                  //     setState(() {
                  //       locked = !locked;
                  //     });
                  //   },
                  // ),
                  hintText: 'Confirm your Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 104, 208, 161)),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 104, 208, 161),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {},
                  child: const Text('Register'))
            ],
          ),
        ),
      )),
    );
    ;
  }
}
