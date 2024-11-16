
import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/view_models/auth_view_model.dart';
import 'package:ecommerce_app/view_models/themma_view_model.dart';
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
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);
    final user = authViewModel.user;
    final List<String> listProfile = [
    user?.displayName??"No Name", 
    user?.email??"No email",
    user?.photoURL?? "assets/images/emty-avatar.png"
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
                color: Theme.of(context).primaryColor,
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
          ],
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
            children: [
              Material(
                color: Theme.of(context).cardColor,
                shadowColor: Theme.of(context).shadowColor,
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(children: [
                    const Icon(Icons.person, size: 30,),
                    const SizedBox(width: 15,),
                    Text("Infomation", style: TextHelper.bodyTextStyle(context),),
                  ],),
                ),
              ),
              const SizedBox(height: 20,),
              Material(
                color: Theme.of(context).cardColor,
                shadowColor: Theme.of(context).shadowColor,
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(children: [
                    const Icon(Icons.security, size: 30,),
                    const SizedBox(width: 15,),
                    Text("Security", style: TextHelper.bodyTextStyle(context),),
                  ],),
                ),
              ),
              const SizedBox(height: 20,),
              Material(
                color: Theme.of(context).cardColor,
                shadowColor: Theme.of(context).shadowColor,
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Row(children: [
                      Icon(themeViewModel.isDarkTheme ? Icons.dark_mode : Icons.light_mode,),
                      const SizedBox(width: 15,),
                      Text("Light/Dark", style: TextHelper.bodyTextStyle(context),),
                      ],
                    ),
                    Switch(value: themeViewModel.isDarkTheme, 
                        onChanged: (value) {
                        themeViewModel.toggleTheme(); })
                    ]
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Material(
                color: Theme.of(context).cardColor,
                shadowColor: Theme.of(context).shadowColor,
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(children: [
                    const Icon(Icons.logout, size: 30,),
                    const SizedBox(width: 15,),
                    Text("LogOut", style: TextHelper.bodyTextStyle(context),),
                  ],),
                ),
              ),
            ],
          ),
        ),
        ],),
      ),
    );
  }
}