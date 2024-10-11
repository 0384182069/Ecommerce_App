
import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Stack(children: [
            Container(
              padding: const EdgeInsets.only(top: 45,left: 20,right: 20),
              height: MediaQuery.of(context).size.height/4.2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(MediaQuery.of(context).size.width,110),
                )
              )
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/6.5 ),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.asset("images/avatar.png",height: 120,width: 120,fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Pham Hoai Phuc", style: TextHelper.headerTextStyle(color: Colors.white),)
              ],),
            ),
          ],),
            const SizedBox(height: 30,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    const Icon(Icons.person, color: Colors.black,),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Name", style: TextHelper.bodyTextStyle(),),
                      Text("Pham Hoai Phuc", style: TextHelper.bodyTextStyle(),)
                    ],)
                  ],),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    const Icon(Icons.email, color: Colors.black,),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Email", style: TextHelper.bodyTextStyle(),),
                      Text("hoaiphuc24012004@gmail.com", style: TextHelper.bodyTextStyle(),)
                    ],)
                  ],),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    const Icon(Icons.description, color: Colors.black,),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Term and condition", style: TextHelper.headerTextStyle(),)
                    ],)
                  ],),
                ),
              ),
            ), 
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    const Icon(Icons.delete, color: Colors.black,),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Delete account", style: TextHelper.headerTextStyle(),),
                    ],)
                  ],),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(children: [
                    const Icon(Icons.logout, color: Colors.black,),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("Logout", style: TextHelper.headerTextStyle(),),
                    ],)
                  ],),
                ),
              ),
            ),
        ],),
      ),
    );
  }
}