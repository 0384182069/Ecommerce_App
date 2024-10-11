import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/widgets/text_form_field.dart';
import 'package:ecommerce_app/views/register_screen.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            const SizedBox(height: 70,),
            Container(
              alignment: Alignment.topCenter,
              child: const Text("Password Recovery",style: TextStyle(
                color: Colors.white, 
                fontSize: 30, 
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold, 
              )),
            ),
            const SizedBox(height: 10,),
            const Text("Enter your email", style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold, 
            ),),
            Expanded(
              child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: emailController,  
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return "Please enter your email";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white,fontSize: 18),
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey,fontSize: 18,fontFamily: "Poppins"),
                          prefixIcon: Icon(Icons.person, color: Colors.grey,size: 30,),
                          border: InputBorder.none,
                        ),
                        ),
                    ),
                    const SizedBox(height: 40,),
                    Container(
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text("Send Email",style: TextHelper.bodyTextStyle(),)),
                    ),
                    const SizedBox(height: 50,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const Text("Don't have an account?", style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                      )
                    ),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Register()));
                      },
                      child: const Text("Create", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.blue,
                        )
                      ),
                    ),
                  ],),
                ],
                ),
            ))),
          ],
        ),
      ),
    );
  }
}