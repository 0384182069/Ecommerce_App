import 'package:ecommerce_app/admin/admin_home.dart';
import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/utils/toast_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  //hoaiphuc@gmail.com
  //admin123
  String email = "", password = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2,),
                padding: const EdgeInsets.only(top: 45,left: 20,right: 20),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration:  BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 53, 51, 51), Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.elliptical(MediaQuery.of(context).size.width,110),
                  )
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30,right: 30,top: 80),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Text("Let's start with\nAdmin!", style: TextHelper.headerTextStyle(context),),
                      const SizedBox(height: 80,),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height/2.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Column(
                              children: [
                              const SizedBox(height: 50,),
                              Container(
                                padding: const EdgeInsets.only(left: 20, top: 10,bottom: 10),
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade800),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    cursorColor: Colors.black,
                                    controller: emailController,
                                    style: TextHelper.bodyTextStyle(context),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Please enter your email";
                                      }
                                      return null;
                                    },
                                    decoration:  InputDecoration(
                                      border: InputBorder.none, 
                                      hintText: "Username",
                                      hintStyle: TextHelper.subtitleTextStyle(),),
                                  ),),
                              ),
                              const SizedBox(height: 20,),
                              Container(
                                padding: const EdgeInsets.only(left: 20, top: 10,bottom: 10),
                                margin: const EdgeInsets.symmetric(horizontal: 2),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade800),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: TextFormField(
                                    obscureText: true,
                                    cursorColor: Colors.black,
                                    controller: passwordController,
                                    style: TextHelper.bodyTextStyle(context),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Please enter your password";
                                      }
                                      return null;
                                    },
                                    decoration:  InputDecoration(
                                      border: InputBorder.none, 
                                      hintText: "Password",
                                      hintStyle: TextHelper.subtitleTextStyle(),),
                                ),),
                              ),
                              const SizedBox(height: 40,),
                              GestureDetector(
                                onTap: (){
                                  setState(() async {
                                    if (_formkey.currentState!.validate()) {
                                      email = emailController.text.trim();
                                      password = passwordController.text.trim();
        
                                      loginAdmin(email, password);
                                    }
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text("Login", style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),)),
                                ),
                              ),
                            ],),
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  loginAdmin(String email, String password) async {
    try{
      showDialog(
        context: context, 
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );

      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop(); 
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const AdminHome()));
      ToastHelper.showToast("Login Successfully!", Colors.green);
    } on FirebaseAuthException catch (e){
      if(e.code == "user-not-found" || e.code == "wrong-password"){
        Navigator.of(context).pop(); 
        ToastHelper.showToast("Wrong password or username!", Colors.red);
      }
      else if (e.code == "invalid-credential"){
        Navigator.of(context).pop(); 
        ToastHelper.showToast("Invalid credential!", Colors.red);
      }
    }
  }
}