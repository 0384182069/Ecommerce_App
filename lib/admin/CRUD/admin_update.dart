import 'dart:io';
import 'package:ecommerce_app/services/cloud_store.dart';
import 'package:ecommerce_app/services/api_call.dart';
import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/utils/toast_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdminUpdate extends StatefulWidget {
  final Map<String, dynamic> productData;
  final String productId;
  const AdminUpdate({super.key, required this.productId,required this.productData});

  @override
  State<AdminUpdate> createState() => _AdminUpdateState();
}

class _AdminUpdateState extends State<AdminUpdate> {
  final List<String> categories = ["Chicken", "Pizza", "Burger", "Combo"];
  String? category;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  File? selectedImage;
  final RestApi api = RestApi();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.productData['name'];
    priceController.text = widget.productData['price'].toString();
    detailController.text = widget.productData['detail'];
    category = widget.productData['category']; 
  }
  // Đường dẫn hình
  Future getImage() async {
    var image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future<void> updateFoodItem() async {
    if (selectedImage != null) {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
      // POST API
      Uint8List bytes = await selectedImage!.readAsBytes();
      String? imageUrl = await api.uploadImage(bytes, selectedImage!.path);

      // Cập nhật thông tin vào Firestore
      if (imageUrl != null) {
        Map<String, dynamic> productData = {
          "name": nameController.text,
          "price": priceController.text,
          "detail": detailController.text,
          "category": category,
          "imageUrl": imageUrl
        };

        await CloudStore().updateFoodItem(widget.productId,productData);

        Navigator.of(context).pop();
        ToastHelper.showToast("Food item updated successfully!", Colors.green);
      } else {

        Navigator.of(context).pop();
        ToastHelper.showToast("Choose your food image!", Colors.red);
      }
    } else {
      Map<String, dynamic> productDate = {
        "name": nameController.text,
        "price": priceController.text,
        "detail": detailController.text,
        "category": category,
      };

      await CloudStore().updateFoodItem(widget.productId, productDate);

      Navigator.of(context).pop();
      ToastHelper.showToast("Food item updated successfully!", Colors.green);
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
          child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
        ),
        centerTitle: true,
        title: Text("Update Food Item", style: TextHelper.headerTextStyle(context)),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 40),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("Upload New Food Picture", style: TextHelper.bodyTextStyle(context))),
                const SizedBox(height: 10),
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
                          border: Border.all(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: selectedImage == null
                            ? ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    widget.productData['imageUrl'], 
                                    fit: BoxFit.cover,
                                  ),
                                )  
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(selectedImage!, fit: BoxFit.cover),
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text("Food Name", style: TextHelper.bodyTextStyle(context)),
                const SizedBox(height: 10),
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
                      hintText: "Food Name",
                      hintStyle: TextHelper.subtitleTextStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a food name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Text("Food Price", style: TextHelper.bodyTextStyle(context)),
                const SizedBox(height: 10),
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
                      hintText: "Food Price",
                      hintStyle: TextHelper.subtitleTextStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a price';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Text("Food Detail", style: TextHelper.bodyTextStyle(context)),
                const SizedBox(height: 10),
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
                      hintText: "Food Detail",
                      hintStyle: TextHelper.subtitleTextStyle(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter food details';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                Text("Food Category", style: TextHelper.bodyTextStyle(context)),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color(0xFFececf8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: categories
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item, style: TextHelper.bodyTextStyle(context)),
                              ))
                          .toList(),
                      onChanged: (category) => setState(() {
                        this.category = category;
                      }),
                      hint: Text("Select Category", style: TextHelper.bodyTextStyle(context)),
                      value: category,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await updateFoodItem();
                      }
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text("Update Food", style: TextHelper.headerTextStyle(context)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
