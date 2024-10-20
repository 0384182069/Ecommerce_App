import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/view_models/auth_view_model.dart';
import 'package:ecommerce_app/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool chicken = false, pizza = false, combo = false, burger = false;
  
  
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final user = authViewModel.user;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
          "Hello ${user?.displayName}",
          style: TextHelper.bodyTextStyle(context),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
          ),
        ),
      ],
    ),
    Text(
      "Delicious food",
      style: TextHelper.headerTextStyle(context),
    ),
    Text(
      "Discover and get food",
      style: TextHelper.subtitleTextStyle(),
    ),
    const SizedBox(height: 5),
    showItems(),
    const SizedBox(height: 10),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(children: [
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 320,
                height: 180,
                child: Image.asset("assets/images/banner1.png", fit: BoxFit.cover,),
              ),
            ),
          ),
          const SizedBox(width: 5,),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 320,
                height: 180,
                child: Image.asset("assets/images/banner2.png", fit: BoxFit.cover,),
              ),
            ),
          ),
        ],)
    ),
    const SizedBox(height: 10),
    IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Details()));
          },
           child: Material(
            color: Theme.of(context).cardColor,
            elevation: 5,
            borderRadius: BorderRadius.circular(25),
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
              child: Column(
                children: [
                  Image.asset("assets/images/1-Fried-Chicken.png",width: 165,height: 165,fit: BoxFit.cover,),
                  SizedBox(
                    width: 160,
                    child: Text(
                      "1 Miếng Gà Rán",
                      style: TextHelper.bodyTextStyle(context), 
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
           ),
         ),
          Material(
          color: Theme.of(context).cardColor,
          elevation: 5,
          borderRadius: BorderRadius.circular(25),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
            child: Column(
              children: [
                Image.asset("assets/images/2-Fried-Chicken.png",width: 165,height: 165,fit: BoxFit.cover,),
                SizedBox(
                  width: 160,
                  child: Text(
                    "2 Miếng Gà Giòn",
                    style: TextHelper.bodyTextStyle(context), 
                    textAlign: TextAlign.center,
                    softWrap: true,
                  )
                )
              ],
            ),
          ),
         ),
        ],
      ),
    ),
  ],
),

);
}
  Widget showItems(){
    return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    chicken = true;
                    pizza = false;
                    combo = false;
                    burger = false;
                  });
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: chicken?
                        Theme.of(context).primaryColor:
                        Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/images/chicken.png",
                      height: 50,width: 50,
                      fit: BoxFit.cover,
                      color: chicken?
                        Theme.of(context).colorScheme.primary:
                        Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    chicken = false;
                    pizza = true;
                    combo = false;
                    burger = false;
                  });
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: pizza?
                        Theme.of(context).primaryColor:
                        Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/images/pizza.png",
                    height: 50,width: 50,
                    fit: BoxFit.cover,
                    color: pizza?
                      Theme.of(context).colorScheme.primary:
                      Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    chicken = false;
                    pizza = false;
                    combo = false;
                    burger = true;
                  });
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: burger?                        
                        Theme.of(context).primaryColor:
                        Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/images/burger.png",
                    height: 50,width: 50,
                    fit: BoxFit.cover,
                    color: burger?
                      Theme.of(context).colorScheme.primary:
                      Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    chicken = false;
                    pizza = false;
                    combo = true;
                    burger = false;
                  });
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                     decoration: BoxDecoration(
                      color: combo?
                        Theme.of(context).primaryColor:
                        Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("assets/images/combo.png",
                    height: 50,width: 50,
                    fit: BoxFit.cover,
                    color: combo?
                      Theme.of(context).colorScheme.primary:
                      Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
            ],);
  }
}
