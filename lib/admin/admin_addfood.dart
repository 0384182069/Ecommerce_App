import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:flutter/material.dart';

class AdminAddfood extends StatefulWidget {
  const AdminAddfood({super.key});

  @override
  State<AdminAddfood> createState() => _AdminAddfoodState();
}

class _AdminAddfoodState extends State<AdminAddfood> {
  final List<String> categories = ["Chicken","Pizza", "Burger", "Combo"];
  String? value;
  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController detailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,)
        ),
        centerTitle: true,
        title: Text("Add Food Items",style: TextHelper.headerTextStyle(context),),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20,right: 20, top: 40, bottom: 40),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Upload The Food Picture",style: TextHelper.bodyTextStyle(context),)),
              const SizedBox(height: 10,),
              Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 165,
                    height: 165,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: 1.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.camera_alt_outlined, color: Colors.black, size: 50,),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Text("Food Name", style: TextHelper.bodyTextStyle(context),),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: nameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your Food Name",
                    hintStyle: TextHelper.subtitleTextStyle()
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Text("Food Price", style: TextHelper.bodyTextStyle(context),),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: priceController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your Food Price",
                    hintStyle: TextHelper.subtitleTextStyle()
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Text("Food Detail", style: TextHelper.bodyTextStyle(context),),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 6,
                  controller: detailController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Your Food Detial",
                    hintStyle: TextHelper.subtitleTextStyle()
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Text("Food Category", style: TextHelper.bodyTextStyle(context),),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: categories.map((item)=>DropdownMenuItem<String>(
                      value: item,
                      child: Text(item,style: TextHelper.bodyTextStyle(context),))).toList(), 
                    onChanged: ((value) => setState(() {
                      this.value = value;
                    })),
                    borderRadius: BorderRadius.circular(10),
                    dropdownColor: Colors.white, 
                    hint: Text("Select Category", style: TextHelper.bodyTextStyle(context),), 
                    iconSize: 40,
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.black,),
                    value: value,)
                ),
              ),
              const SizedBox(height: 30,),
              Center(
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width/2,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(child: Text("Add", style:TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),),
                  ),
                ),
              ),
          ],),
        ),
      ),
    );
  }
}