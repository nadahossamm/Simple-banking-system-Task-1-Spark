import 'package:flutter/material.dart';
import 'package:task1spark/Database/db.dart';

import 'MainPage.dart';

class withdrow extends StatefulWidget {
  @override
  State<withdrow> createState() => _withdrowState();
}

class _withdrowState extends State<withdrow> {
  @override
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  int first = 0;
  int sec = 0;
  int money = 0;
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transfer Money"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller1,
                cursorWidth: 2,
                decoration: const InputDecoration(
                  hintText: 'Enter Person Id To Withdraw From ',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Can't be empty";
                  }
                },
                onChanged: (val) {
                  setState(() {
                    first = int.parse(val);
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: controller2,
                cursorWidth: 2,
                decoration: const InputDecoration(
                  hintText: 'Enter Person Id To Transfer ',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Can't be empty";
                  }
                },
                onChanged: (val) {
                  setState(() {
                    sec = int.parse(val);
                  });
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: controller3,
                cursorWidth: 2,
                decoration: const InputDecoration(
                  hintText: 'Amount Of Money ',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black38)),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Can't be empty";
                  }
                },
                onChanged: (val) {
                  setState(() {
                    money = int.parse(val);
                  });
                },
              ),
              Container(
                width: 150,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        int x=customerList2![first-1].currentBalance-money;
                       int y= customerList2![sec-1].currentBalance=customerList2![sec-1].currentBalance+money;
                        updateDatabase(balance: x,id: first);
                        updateDatabase(balance: y,id: sec);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Transfer Successfully')),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      }


                    },
                    child: const Text("Transfer")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
