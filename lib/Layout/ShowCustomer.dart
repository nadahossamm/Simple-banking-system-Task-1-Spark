import 'package:flutter/material.dart';
import 'package:task1spark/Layout/Customerprofile.dart';
import '../Database/db.dart';

class CustomersPage extends StatelessWidget {
  const CustomersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Customer"),
        ),
        body:Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children:  [
                const Text("SELECT CUSTOMER",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.blue,

                ),),
              Expanded(
                child: ListView.builder(
                    itemCount:11,
                    itemBuilder: (context, index) => ListTile(
                      leading: Container(
                        alignment: Alignment.center,
                        height:  MediaQuery.of(context).size.height /20,
                        width: MediaQuery.of(context).size.width / 15 ,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                          BorderRadius.circular(20),
                        ),

                       child:  Text(
                         ( index+1).toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      title: Text(customerList2![index].name,style: const TextStyle(
                        fontSize: 17,
                      )),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.blue,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CustomerProfile (index:index)),
                          );
                        },
                      ),
                    )),
              ),
                   ],
            ),
          ),
        )
    );
  }
}
