
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommerce_app/views/home_view.dart';
import 'package:ecommerce_app/views/order_view.dart';
import 'package:ecommerce_app/views/profile_view.dart';
import 'package:ecommerce_app/views/wallet_view.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homePage;
  late Wallet walletPage;
  late Profile profilePage;
  late Order orderPage;
  @override
  void initState(){
    homePage = const Home();
    walletPage = const Wallet();
    profilePage = const Profile();
    orderPage = const Order();
    pages = [homePage, walletPage, orderPage, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).canvasColor,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex=index;
          });
        },
        items: const [
        Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.wallet_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.person_outlined,
          color: Colors.white,
        ),  
      ]),
      body: pages[currentTabIndex],
    );
  }
}