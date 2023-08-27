import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:myapp/components/my_text_field.dart';
import 'package:myapp/pages/status.dart';
import '../components/my_api.dart';

class FixerC extends StatefulWidget {
  final String ndevice, brand, problem, time, place, detail, process;
  const FixerC(
      {super.key,
      required this.ndevice,
      required this.brand,
      required this.problem,
      required this.time,
      required this.place,
      required this.detail,
      required this.process});

  @override
  State<FixerC> createState() => _FixerCState();
}

class _FixerCState extends State<FixerC> {
  var a, b, c, d, e, f, p;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a = widget.ndevice;
    b = widget.brand;
    c = widget.problem;
    d = widget.time;
    e = widget.place;
    f = widget.detail;
    p = widget.process;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fixer Confirm"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name Device : ${a}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Brand : ${b}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Problem : ${c}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Time : ${d}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Place : ${e}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Detail : ${f}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 130),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 3, 68, 121)),
                  ),
                  onPressed: () {
                    postFixer();
                    setState(() {});
                  },
                  child: const Text('Confirm'),
                ),
              ),
            ]),
      ),
    );
  }

  Future postFixer() async {
    // var url = Uri.https('abcd.ngrok.io', '/api/post-todolist');
    var url = Uri.http(URL(), 'post-fixer');
    Map<String, String> header = {"Content-type": "application/json"};
    int user = 25;

    String f0 = '"idctm" : "${user}"';
    String f1 = '"ndevice":"${a}"';
    String f2 = '"brand":"${b}"';
    String f3 = '"problem":"${c}"';
    String f4 = '"time":"${d}"';
    String f5 = '"place":"${e}"';
    String f6 = '"detail":"${f}"';

    String jsondata = '{$f0,$f1,$f2,$f3,$f4,$f5,$f6}';
    print(jsondata);
    var response = await http.post(url, headers: header, body: jsondata);
    print('--------result--------');
    print(response.body);
    var data = json.decode(response.body);
    print(data['id']);
    int id = data['id'];
    setState(() {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StatusFixer(id: id)));
    });
  }
}
