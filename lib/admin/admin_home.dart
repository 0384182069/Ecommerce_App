import 'package:ecommerce_app/admin/CRUD/admin_create.dart';
import 'package:ecommerce_app/admin/CRUD/admin_read.dart';
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
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Admin", style: TextHelper.headerTextStyle(context),),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10, left: 10,right: 10),
        child: const AdminRead(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>const AdminCreate())),
        child: const Icon(Icons.add, color: Colors.white,),
        ),
    );
  }
}