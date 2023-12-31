import 'package:flutter/material.dart';

import 'package:myapp/pages/profile_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:myapp/pages/login.dart';

import '../components/my_api.dart';

class Registers extends StatefulWidget {
  const Registers({super.key});

  @override
  State<Registers> createState() => _RegistersState();
}

class _RegistersState extends State<Registers> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final tellController = TextEditingController();

  late SharedPreferences regisdata;
  late bool newcus;

  @override
  void initState() {
    super.initState();
    check_if_already_register();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Register'),
      // ),
      backgroundColor: (Colors.white),
      body: ListView(
        children: [
          Container(child: Image.asset('assets/images/logo.png')),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Let's create an account for you!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Name', border: OutlineInputBorder()),
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
                const SizedBox(height: 10),
                //confirm password
                TextField(
                  controller: tellController,
                  decoration: InputDecoration(
                      labelText: 'Tell', border: OutlineInputBorder()),
                ),

                const SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 3, 68, 121))),
                    onPressed: () {
                      String name = nameController.text;
                      String password = passwordController.text;
                      String email = emailController.text;
                      String tell = tellController.text;

                      if (name != '' && password != '') {
                        print('Successful');
                        regisdata.setBool('Register', false);
                        regisdata.setString('name', name);
                        regisdata.setString('email', email);
                        regisdata.setString('tell', tell);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Logins(),
                            ));
                      }
                      postTodo();
                    },
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void check_if_already_register() async {
    regisdata = await SharedPreferences.getInstance();
    newcus = (regisdata.getBool('Register') ?? true);

    print(newcus);
    if (newcus == false) {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => ProfileScreen()));
    }
  }

  Future postTodo() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'register');
    Map<String, String> header = {"Content-type": "application/json"};
    String v1 = '"name":"${nameController.text}"';
    String v2 = '"email":"${emailController.text}"';
    String v3 = '"password":"${passwordController.text}"';
    String v4 = '"tell":"${tellController.text}"';
    String jsondata = '{$v1,$v2,$v3,$v4}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
  }
}
