import 'dart:ui';

import 'package:flutter/material.dart';

import '../Database/db.dart';
import 'withdrow.dart';

class CustomerProfile extends StatelessWidget {
    int ? index;
   CustomerProfile({Key? key, this.index}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Profile"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Customer Profile",
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue),),
                const SizedBox(
                  height: 30,
                ),
                const Text("Name",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
                const SizedBox(
                  height: 10,
                ),

                Text(customerList2![index!].name,
                  style: TextStyle(fontSize: 20,),),
                const SizedBox(
                  height: 20,
                ),
                const Text("Email",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),

                const SizedBox(
                  height: 10,
                ),
                 Text(customerList2![index!].email,
                  style: TextStyle(fontSize: 20),),
                const SizedBox(
                  height: 20,
                ),
                const Text("Current Balance",
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),

                const SizedBox(
                  height: 10,
                ),
                Text(customerList2![index!].currentBalance.toString(),
                  style: TextStyle(fontSize: 20),),

                const SizedBox(
                  height: 30,
                ),


              ],
        ),
      ),

    );
  }
}
