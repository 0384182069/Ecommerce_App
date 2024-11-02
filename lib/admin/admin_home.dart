import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60, left: 20,right: 20),
        child: Column(children: [
          Center(child: Text("Home Admin", style: TextHelper.headerTextStyle(context),),),
          const SizedBox(height: 80,),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(15),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset("assets/images/1-Fried-Chicken.png", height: 100,width: 100, fit: BoxFit.cover,),),
                    const SizedBox(width: 20,),
                    const Text("Add food items",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),)
                ],),
              ),
            ),
          ),
        ],),
      ),
    );
  }
}