import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductList extends StatefulWidget {
  final String selectedCategory;
  const ProductList({super.key, required this.selectedCategory});
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: 
        widget.selectedCategory == "" ?
          FirebaseFirestore.instance.collection('Products').snapshots()
          :FirebaseFirestore.instance
              .collection('Products')
              .where('category', isEqualTo: widget.selectedCategory)
              .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                'No products available',
                style: TextHelper.bodyTextStyle(context),
              ),
            ),
          );
        }

        final products = snapshot.data!.docs.map((doc) {
          return Product.fromMap(doc.data() as Map<String, dynamic>, doc.id);
        }).toList();

        return SizedBox(
          height: MediaQuery.of(context).size.height - 300,
          child: ListView(
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.73,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            id: product.id,
                            name: product.name,
                            detail: product.detail,
                            price: product.price,
                            image: product.imageUrl,
                          ),
                        ),
                      );
                    },
                    child: Material(
                      color: Theme.of(context).cardColor,
                      shadowColor: Theme.of(context).shadowColor,
                      elevation: 5,
                      borderRadius: BorderRadius.circular(25),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: snapshot.connectionState == ConnectionState.waiting
                                  ? const Center(child: CircularProgressIndicator())
                                  : Image.network(
                                      product.imageUrl,
                                      width: 165,
                                      height: 165,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(
                                          Icons.broken_image,
                                          size: 100,
                                          color: Colors.grey,
                                        );
                                      },
                                    ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 160,
                              child: Text(
                                product.name,
                                style: TextHelper.bodyTextStyle(context),
                                textAlign: TextAlign.center,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

