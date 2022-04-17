import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task1spark/Layout/ShowCustomer.dart';

import 'withdrow.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Banking System"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              const Text("WELCOME TO BANKING SYSTEM",
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(onPressed:(){

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomersPage()),
                );
              }, child: const Text("View All Customer")),
             const SizedBox(
                height: 50,
              ),
              Container(
                width: 150,
                child: ElevatedButton(onPressed:(){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => withdrow()),
                  );
                }, child: const Text("Transfer")),
              ),
              SizedBox(
                height: 50,
              ),
              const Text("Nada Hossam Task1",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

            ],
          ),
        ),
      )
    );
  }
}
