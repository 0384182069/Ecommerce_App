import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:flutter/material.dart';



class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  int quantity = 1;
  void increaseQuantity(){
    ++quantity;
  }
  void decreaseQuantity(){
    --quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),
            ),
            Image.asset(
              "images/salad2.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/1.15,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mediterranean", style: TextHelper.bodyTextStyle(),),
                  Text("Chickpea Salad", style: TextHelper.bodyTextStyle(),),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  setState(() {
                   if(quantity>1){
                    decreaseQuantity();
                   }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.remove, color: Colors.white,),
                ),
              ),
              const SizedBox(width: 10,),
              Text(quantity.toString(),style: TextHelper.bodyTextStyle(),),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    increaseQuantity();
                  });
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.add, color: Colors.white,),
                ),
              ),
            ],),
            const SizedBox(height: 10,),
            Text(
              "A Mediterranean Chickpea Salad is a vibrant, healthy dish packed with fresh ingredients and bold flavors.",
              style: TextHelper.subtitleTextStyle(),
            ),
            Row(children: [
              Text("Delivary Time", style: TextHelper.bodyTextStyle(),),
              const SizedBox(width: 10,),
              const Icon(Icons.alarm, color: Colors.black54,),
              const SizedBox(width: 10,),
              Text("30 min", style: TextHelper.bodyTextStyle(),),
            ],),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Total Price", style: TextHelper.bodyTextStyle(),),
                  Text("\$28",style: TextHelper.headerTextStyle(),),
                ],),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8),),
                  child: const Row(children: [
                    Text("Add to cart",style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Poppins")),
                    SizedBox(width: 10,),
                    Icon(Icons.add_shopping_cart,color: Colors.white, size: 30,),
                  ],),
                )
              ],),
            )
          ],
        ),
      ),
    );
  }
}