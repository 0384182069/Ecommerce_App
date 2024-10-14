
import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/view_models/auth_view_model.dart';
import 'package:ecommerce_app/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}



class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final user = authViewModel.user;
    final List<String> listProfile = [
    user?.displayName??"No Name", 
    user?.email??"No email",
    user?.photoURL?? "images/emty-avatar.png"
    ];
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
                    child: listProfile[2].startsWith('http')
                            ? Image.network(
                                listProfile[2], 
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                listProfile[2], 
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("${user?.displayName}", style: TextHelper.headerTextStyle(color: Colors.white),)
                ],
              ),
            ),
          ],
        ),
        ListView()
        ],),
      ),
    );
  }
}