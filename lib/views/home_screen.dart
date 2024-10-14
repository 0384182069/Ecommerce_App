import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/view_models/login_view_model.dart';
import 'package:ecommerce_app/views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    final user = loginViewModel.user;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
          "Hello ${user?.displayName}",
          style: TextHelper.bodyTextStyle(),
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
      style: TextHelper.headerTextStyle(),
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
                child: Image.asset("images/banner1.png", fit: BoxFit.cover,),
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(25),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 320,
                height: 180,
                child: Image.asset("images/banner2.png", fit: BoxFit.cover,),
              ),
            ),
          ),
        ],)
    ),
    const SizedBox(height: 10),
    Container(
      padding: const EdgeInsets.all(5),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Details()));
            },
             child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(25),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    Image.asset("images/1-Fried-Chicken.png",width: 165,height: 165,fit: BoxFit.cover,),
                    SizedBox(
                      width: 160,
                      child: Text(
                        "1 Miếng Gà Rán",
                        style: TextHelper.bodyTextStyle(), 
                        textAlign: TextAlign.center,
                        softWrap: true,
                      )
                    )
                  ],
                ),
              ),
             ),
           ),
            Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(25),
            child: Padding(padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Image.asset("images/2-Fried-Chicken.png",width: 165,height: 165,fit: BoxFit.cover,),
                  SizedBox(
                    width: 160,
                    child: Text(
                      "2 Miếng Gà Giòn",
                      style: TextHelper.bodyTextStyle(), 
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
                    icecream = true;
                    pizza = false;
                    salad = false;
                    burger = false;
                  });
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: icecream?Colors.black: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("images/chicken.png",
                      height: 50,width: 50,
                      fit: BoxFit.cover,
                      color: icecream?Colors.white: Colors.black,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    icecream = false;
                    pizza = true;
                    salad = false;
                    burger = false;
                  });
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: pizza?Colors.black: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("images/pizza.png",
                    height: 50,width: 50,
                    fit: BoxFit.cover,
                    color: pizza?Colors.white: Colors.black,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    icecream = false;
                    pizza = false;
                    salad = true;
                    burger = false;
                  });
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: salad?Colors.black: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("images/salad.png",
                    height: 50,width: 50,
                    fit: BoxFit.cover,
                    color: salad?Colors.white: Colors.black,),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    icecream = false;
                    pizza = false;
                    salad = false;
                    burger = true;
                  });
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                     decoration: BoxDecoration(
                      color: burger?Colors.black: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(10),
                    child: Image.asset("images/burger.png",
                    height: 50,width: 50,
                    fit: BoxFit.cover,
                    color: burger?Colors.white: Colors.black,),
                  ),
                ),
              ),
            ],);
  }
}
