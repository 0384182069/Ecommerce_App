import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/view_models/auth_view_model.dart';
import 'package:ecommerce_app/view_models/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool chicken = false, pizza = false, combo = false, burger = false;
  String selectedCategory = "";
  
  
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final user = authViewModel.user;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text("Favorites", style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'
                  ),),
                )),
            ),
            ListTile(
              leading: Icon(Icons.favorite, color: Theme.of(context).colorScheme.secondary,),
              title: Text('Favorite Item 1', style: TextHelper.bodyTextStyle(context)),
              onTap: () {
              },
            ),
          ],
          
        ),
        
      ),
      body: Builder(
        builder: (context) => Expanded(
          child: ListView(
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
              "Hello ${user?.displayName}",
              style: TextHelper.bodyTextStyle(context),
            ),
            GestureDetector(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.secondary,
                ),
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
              const SizedBox(height: 15),
              showCategory(),
              const SizedBox(height: 10),
              SingleChildScrollView(
          scrollDirection: Axis.horizontal,
            child: Row(children: [
              Material(
                shadowColor: Theme.of(context).shadowColor,
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
                shadowColor: Theme.of(context).shadowColor,
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
          ProductList(selectedCategory: selectedCategory),
          ],
          ),
        ),
      ),
    );
  }
  Widget showCategory(){
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
                    selectedCategory = 'Chicken';
                  });
                },
                child: Material(
                  shadowColor: Theme.of(context).shadowColor,
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
                    selectedCategory = 'Pizza';
                  });
                },
                child: Material(
                  shadowColor: Theme.of(context).shadowColor,
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
                    selectedCategory = 'Burger';
                  });
                },
                child: Material(
                  shadowColor: Theme.of(context).shadowColor,
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
                    selectedCategory = 'Combo';
                  });
                },
                child: Material(
                  shadowColor: Theme.of(context).shadowColor,
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
