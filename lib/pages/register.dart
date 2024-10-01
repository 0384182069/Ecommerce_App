import 'package:ecommerce_app/components/FontSize.dart';
import 'package:ecommerce_app/components/Toast.dart';
import 'package:ecommerce_app/components/bottommav.dart';
import 'package:ecommerce_app/components/my_TextFormField.dart';
import 'package:ecommerce_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  
  String username = "", email = "", password = "" ,confirmpass="";
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpassController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  registration () async {
    if(password!=null && username!=null && email!=null && confirmpass == password) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        ToastHepler.showSuccessRegister_Top();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomNav()));
      }on FirebaseAuthException catch (e) {
        if(e.code == "weak-password"){
          ToastHepler.showWarningWeakPassword_Top();
        }
        else if(e.code == "email-already-in-use"){
          ToastHepler.showAccountExsits_Top();
        }
        else if(e.code == "invalid-email"){
          ToastHepler.showInvalidEmail_Top();
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2.5,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                    colors: [ 
                      Color(0xFFFFD54F), 
                      Color(0xFFFFB74D), 
                      Color(0xFFFF9800), 
                      Color(0xFFFF5722),
                      Color(0xFFE64A19),
                   ])
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                )),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(children: [
                  Center(
                    child: Image.asset("images/logo.png",width: MediaQuery.of(context).size.width/2, fit: BoxFit.cover,),
                  ),
                  const SizedBox(height: 10,),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/1.7,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      child: Form(
                        key: _formkey,
                        child: Column(children: [
                          const SizedBox(height: 20,),
                          Text("Register",style: FontSize.headLineTextFeilStyle(),),
                          const SizedBox(height: 20,),
                          MyTextfield(
                            validatar: (value){
                              if(value == null || value.isEmpty){
                                return "Please enter your name";
                              }
                              return null;
                            },
                            controller: usernameController,
                            hintText: "Username",
                            icon: const Icon(Icons.person_2_outlined,color: Colors.black,),
                            isPasswordField: false,   
                          ),
                          const SizedBox(height: 5,),
                          MyTextfield(
                            validatar: (value){
                              if(value == null || value.isEmpty){
                                return "Please enter your email";
                              }
                              return null;
                            },
                            controller: emailController,
                            hintText: "Email",
                            icon: const Icon(Icons.email_outlined,color: Colors.black,),
                            isPasswordField: false,   
                          ),
                          const SizedBox(height: 5,),
                          MyTextfield(
                            validatar: (value){
                              if(value == null || value.isEmpty){
                                return "Please enter your password";
                              }
                              return null;
                            },
                            controller: passwordController,
                            hintText: "Password",
                            icon: const Icon(Icons.lock_outline,color: Colors.black,),
                            isPasswordField: true,
                          ),
                          const SizedBox(height: 5,),
                          MyTextfield(
                            validatar: (value){
                              if(value == null || value.isEmpty){
                                return "Please confirm your password";
                              }
                              if(value != passwordController.text){
                                return "Password not matche";
                              }
                              return null;
                            },
                            controller: confirmpassController,
                            hintText: "Confirm password",
                            icon: const Icon(Icons.lock_reset_outlined,color: Colors.black,),
                            isPasswordField: false,
                          ),
                          const SizedBox(height: 60,),
                          GestureDetector(
                            onTap:()async{
                              if(_formkey.currentState!.validate()){
                                setState(() {
                                  email = emailController.text;
                                  username = usernameController.text;
                                  password = passwordController.text;
                                  confirmpass = confirmpassController.text;
                                });
                              }
                              registration();
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                width: 200,
                                decoration: BoxDecoration(color: const Color(0xFFFF5722),borderRadius: BorderRadius.circular(20)),
                                child: const Center(child: Text(
                                  "REGISTER", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                               ),
                              ),
                            ),
                          ),
                        ],),
                      ),
                    ),
                  ),
                ],
                ),
                
              ),
              Positioned(
                bottom: 340,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const Text("Be a member?", style: TextStyle(
                      color: Colors.black38,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      )
                    ),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
                      },
                      child: const Text("Login now", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.blue,
                      )
                      ),
                    ),
                  ],),
                ],),
              ),
            ],
          ),
        ),
      ),
    );
  }
}