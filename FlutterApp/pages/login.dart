// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/components/buttom_nav_bar.dart';
import 'package:myapp/components/my_api.dart';

// import 'package:myapp/pages/register.dart';
import 'dart:async';

import 'package:myapp/pages/register.dart';
// import 'dart:convert';

class Logins extends StatefulWidget {
  const Logins({super.key});

  @override
  State<Logins> createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: ListView(
        children: [
          Container(child: Image.asset('assets/images/logo.png')),
          Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Wellcome to Mr.Fixer",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 10),
                    //password
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                    ),

                    const SizedBox(height: 10),
                    //confirm password
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder()),
                    ),

                    const SizedBox(height: 25),

                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Color.fromARGB(223, 6, 133, 236))),
                            onPressed: () {
                              //postTodo();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registers()),
                              );
                            },
                            child: const Text('Back'),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        Color.fromARGB(255, 3, 68, 121))),
                            onPressed: () {
                              //postTodo();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => buttomBar()),
                              );
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    ),
                  ])),
        ],
      ),
    );
  }

  Future postLogin() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'login');
    Map<String, String> header = {"Content-type": "application/json"};

    String v2 = '"email":"${emailController.text}"';
    String v3 = '"password":"${passwordController.text}"';
    String jsondata = '{$v2,$v3}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }
}


// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:myapp/pages/fixer.dart';
// import 'dart:async';
// import 'dart:convert';
// import '../components/my_text_field.dart';

// class Logins extends StatefulWidget {
//   const Logins({super.key});

//   @override
//   State<Logins> createState() => _LoginsState();
// }

// class _LoginsState extends State<Logins> {
//   final _form = GlobalKey<FormState>();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(12),
//       child: Form(key: _form,child: Column(children: [
        
//       ],),),))
//     );
//   }
// }
