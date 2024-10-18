import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Material(
            color: Theme.of(context).cardColor,
            elevation: 5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text("Wallet", style: TextHelper.headerTextStyle(context),),),
          ),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Row(children: [
              Image.asset("images/wallet.png", width: 60,height: 60,fit: BoxFit.cover,),
              const SizedBox(width: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Your Wallet", style: TextHelper.subtitleTextStyle(),),
                const SizedBox(height: 10,),
                Text("\$100", style: TextHelper.bodyTextStyle(context),)
              ],)
            ],),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("Add Money", style: TextHelper.bodyTextStyle(context),),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("\$100", style: TextHelper.bodyTextStyle(context),),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("\$500", style: TextHelper.bodyTextStyle(context),),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("\$1000", style: TextHelper.bodyTextStyle(context),),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("\$2000", style: TextHelper.bodyTextStyle(context),),
            ),
          ],),
          const SizedBox(height: 40,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 12),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Text("Add Money", style: TextHelper.headerTextStyle(context),),),
          ),
        ],),
      ),
    );
  }
}