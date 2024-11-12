import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:flutter/material.dart';



class Details extends StatefulWidget {
  final String id;
  final String name;
  final String detail;
  final double price;
  final String image;

  const Details({
    super.key, 
    required this.id,
    required this.name, 
    required this.detail, 
    required this.price, 
    required this.image,});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined, color: Theme.of(context).primaryColor,),
                ),
                Icon(Icons.favorite_border, color: Theme.of(context).primaryColor,),
              ]
            ),
            Image.network(
              widget.image,
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
                  Text(widget.name, style: TextHelper.headerTextStyle(context),)
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
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.remove,color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
              const SizedBox(width: 10,),
              Text(quantity.toString(),style: TextHelper.headerTextStyle(context),),
              const SizedBox(width: 10,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    increaseQuantity();
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.add,color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
            ],),
            const SizedBox(height: 10,),
            Text(
              widget.detail,
              style: TextHelper.subtitleTextStyle(),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Total Price", style: TextHelper.headerTextStyle(context),),
                  Text("\$${widget.price*quantity}",style: TextHelper.headerTextStyle(context),),
                ],),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),),
                  child: Row(children: [
                    Text("Add to cart",style: TextHelper.headerTextStyle(context),),
                    const SizedBox(width: 10,),
                    Icon(Icons.add_shopping_cart, color: Theme.of(context).colorScheme.onSecondary,size: 30,),
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