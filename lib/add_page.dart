import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoicegenerator/global.dart';
import 'textbox.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.black,
        elevation: 8,
        title: Text(
          'Add page',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Client 1',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.delete_outline),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 450,
                    width: 495,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            blurRadius: 5,
                            spreadRadius: 5),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    children: [
                      TextForCilent(
                          hint: 'Priyam Tripathi',
                          isPhone: false,
                          isAddress: false,
                          isNumber: false,
                          lable: 'Name',
                          controller: txtName),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextForCilent(
                            hint: '9876543210',
                            isPhone: true,
                            isAddress: false,
                            isNumber: true,
                            lable: 'Mobile Number',
                            controller: txtMobileNum),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextForCilent(
                            hint: 'priyamtripathiii03@gmail.com',
                            isPhone: false,
                            isAddress: false,
                            isNumber: false,
                            lable: 'Email Address',
                            controller: txtEmail),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: TextForCilent(
                            hint:
                                '262, Ram Nagar, Pandesara, Surat, Gujarat, India',
                            isPhone: true,
                            isAddress: true,
                            isNumber: false,
                            lable: 'Address',
                            controller: txtAddress),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/home');
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}

List data = [];
