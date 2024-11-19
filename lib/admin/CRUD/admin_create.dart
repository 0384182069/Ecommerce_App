import 'dart:io';
import 'package:ecommerce_app/services/cloud_store.dart';
import 'package:ecommerce_app/services/api_call.dart';
import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/utils/toast_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AdminCreate extends StatefulWidget {
  const AdminCreate({super.key});

  @override
  State<AdminCreate> createState() => _AdminCreateState();
}

class _AdminCreateState extends State<AdminCreate> {

  final List<String> categories = ["Chicken","Pizza", "Burger", "Combo"];
  String? category;
  TextEditingController nameController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController detailController = new TextEditingController();
  final ImagePicker _imagePicker = ImagePicker(); 
  File? selectedImage; 
  final RestApi api = RestApi();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Đường dẫn hình 
  Future getImage() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        print(selectedImage);
      });
    }
  }
  Future<void> addFoodItem() async {
    if (selectedImage != null) {
      showDialog(
        context: context, 
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
      //POST API
      Uint8List bytes = await selectedImage!.readAsBytes();
      String? imageUrl = await api.uploadImage(bytes,selectedImage!.path);
      
      //Thêm vào firebase cloud
      if (imageUrl != null) {
        Map<String, dynamic> foodData = {
          "name": nameController.text,
          "price": priceController.text,
          "detail": detailController.text,
          "category": category,
          "imageUrl": imageUrl 
        };

        await CloudStore().addFoodItem(category!,foodData);

        // Thông báo thành công và làm mới trạng thái
        setState(() {
          selectedImage = null;
          nameController.clear();
          priceController.clear();
          detailController.clear();
          category = null;
        });

        Navigator.of(context).pop();
        ToastHelper.showToast("Food item added successfully!", Colors.green);
      } else {
        Navigator.of(context).pop();
        ToastHelper.showToast("Choose your food image!", Colors.red);
      }
    }
  }

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Upload The Food Picture",style: TextHelper.bodyTextStyle(context),)),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: getImage,
                  child: Center(
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 165,
                        height: 165,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black,width: 1.5),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: selectedImage == null 
                        ?const Icon(
                          Icons.camera_alt_outlined, 
                          color: Colors.black, 
                          size: 50,)
                        : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(selectedImage!, fit: BoxFit.cover,),
                        ),
                      ),
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
                  child: TextFormField(
                    controller: nameController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your Food Name",
                        hintStyle: TextHelper.subtitleTextStyle()),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a food name';
                      }
                      return null;
                    },),
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
                  child: TextFormField(
                    controller: priceController,
                    cursorColor: Colors.black,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),  
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Your Food Price",
                      hintStyle: TextHelper.subtitleTextStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the price';
                      }
                      return null;  
                    },
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
                  child: TextFormField(
                    maxLines: 6,
                    controller: detailController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Your Food Detail",
                        hintStyle: TextHelper.subtitleTextStyle()),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a food detail';
                      }
                      return null;
                    },),
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
                      onChanged: ((category) => setState(() {
                        this.category = category;
                      })),
                      borderRadius: BorderRadius.circular(10),
                      dropdownColor: Colors.white, 
                      hint: Text("Select Category", style: TextHelper.bodyTextStyle(context),), 
                      iconSize: 40,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.black,),
                      value: category,)
                  ),
                ),
                const SizedBox(height: 30,),
                Center(
                  child: GestureDetector(
                    onTap: ()async{
                      if(_formKey.currentState!.validate()){
                        await addFoodItem();
                      }
                    },
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
                ),
            ],),
          ),
        ),
      ),
    );
  }
}