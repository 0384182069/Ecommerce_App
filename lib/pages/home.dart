import 'package:ecommerce_app/pages/details.dart';
import 'package:ecommerce_app/components/FontSize.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
          "Hello Join",
          style: FontSize.boilTextFeilStyle(),
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
      style: FontSize.headLineTextFeilStyle(),
    ),
    Text(
      "Discover and get food",
      style: FontSize.lightTextFeilStyle(),
    ),
    const SizedBox(height: 5),
    showItems(),
    const SizedBox(height: 5),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Details()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(4),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/salad2.png",
                        height: 180,
                        width: 180,
                        fit: BoxFit.cover,
                      ),
                      Text("Veggies Taco Hash", style: FontSize.semiBoldTextFeilStyle()),
                      const SizedBox(height: 2),
                      Text("Fresh and Healthy", style: FontSize.lightTextFeilStyle()),
                      const SizedBox(height: 2),
                      Text("\$25", style: FontSize.semiBoldTextFeilStyle()),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(25),
            child: Container(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "images/salad2.png",
                    height: 180,
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                  Text("Mix Veggies Hash", style: FontSize.semiBoldTextFeilStyle()),
                  const SizedBox(height: 2),
                  Text("Spicy with Onion", style: FontSize.lightTextFeilStyle()),
                  const SizedBox(height: 2),
                  Text("\$25", style: FontSize.semiBoldTextFeilStyle()),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    const SizedBox(height: 10),
    Container(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "images/salad2.png",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 20), 
              Column(
                children: [
                  const SizedBox(height:20),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text(
                      "Mediterranean Chickpea Salad", style: FontSize.semiBoldTextFeilStyle()),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text("Honey goat cheese", style: FontSize.lightTextFeilStyle()),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text("\$28", style: FontSize.semiBoldTextFeilStyle()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
    const SizedBox(height: 10,),
    Container(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "images/salad2.png",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 20),
              Column(
                children: [
                  const SizedBox(height:20),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text("Mediterranean Chickpea Salad", style: FontSize.semiBoldTextFeilStyle()),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text("Honey goat cheese", style: FontSize.lightTextFeilStyle()),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: Text("\$28", style: FontSize.semiBoldTextFeilStyle()),
                  ),
                ],
              ),
            ],
          ),
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
