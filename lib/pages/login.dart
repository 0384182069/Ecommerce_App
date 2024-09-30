import 'package:ecommerce_app/components/FontSize.dart';
import 'package:ecommerce_app/components/my_TextField.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernamController = TextEditingController();
  final passwdController = TextEditingController();
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
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
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
                      height: MediaQuery.of(context).size.height/2.2,
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                        const SizedBox(height: 20,),
                        Text("Login",style: FontSize.headLineTextFeilStyle(),),
                        const SizedBox(height: 20,),
                        MyTextfield(
                          controller: usernamController,
                          hintText: "Email",
                          icon: const Icon(Icons.email_outlined,color: Colors.black,),
                          isPasswordField: false,
                          
                        ),
                        const SizedBox(height: 20,),
                        MyTextfield(
                          controller: passwdController,
                          hintText: "Password",
                          icon: const Icon(Icons.password_outlined,color: Colors.black,),
                          isPasswordField: true,
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          alignment: Alignment.topRight,
                          child: Text("Forget Password?",style: FontSize.semiBoldTextFeilStyle(),),
                        ),
                        const SizedBox(height: 60,),
                        Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            width: 200,
                            decoration: BoxDecoration(color: const Color(0xFFFF5722),borderRadius: BorderRadius.circular(20)),
                            child: const Center(child: Text(
                              "LOGIN", style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                           ),
                          ),
                        ),
                      ],),
                    ),
                  ),
                ],
                ),
                
              ),
              const Positioned(
                bottom: 350,
                left: 0,
                right: 0,
                child: Center(
                    child: Text(
                      "Don't have an account? Sign up",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}