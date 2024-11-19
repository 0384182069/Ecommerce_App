import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/admin/CRUD/admin_delete.dart';
import 'package:ecommerce_app/admin/CRUD/admin_update.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/utils/toast_helper.dart';
import 'package:flutter/material.dart';

class AdminRead extends StatefulWidget {
  const AdminRead({super.key});

  @override
  State<AdminRead> createState() => _AdminReadState();
}

class _AdminReadState extends State<AdminRead> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'No products available',
                style: TextHelper.bodyTextStyle(context),
              ),
            );
          }

          final products = snapshot.data!.docs.map((doc) {
            return Product.fromMap(doc.data() as Map<String, dynamic>, doc.id);
          }).toList();

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                color: Colors.black,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: Image.network(
                    product.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    product.name,
                    style: TextHelper.bodyTextStyle(context).copyWith(color: Colors.white),
                  ),
                  subtitle: Text(
                    '\$${product.price}',
                    style: TextHelper.bodyTextStyle(context).copyWith(color: Colors.white),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () {
                             Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminUpdate(
                                  productId: product.id,
                                  productData: {
                                    'id': product.id,
                                    'name': product.name,
                                    'price': product.price.toString(),
                                    'detail': product.detail,
                                    'imageUrl': product.imageUrl,
                                    'category': product.category,
                                  },
                                  ),
                                ),);
                          },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          AdminDelete.deleteProduct(context: context, productId: product.id, onDeleted: (){
                            ToastHelper.showToast("Deleted successfully", Colors.green);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    }
  }
