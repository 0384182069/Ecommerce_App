import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/view_models/cart_view_model.dart';
import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double totalPrice = 0.0; 

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);  

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Material(
              color: Theme.of(context).colorScheme.primary,
              shadowColor: Theme.of(context).shadowColor,
              elevation: 5,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Cart", style: TextHelper.headerTextStyle(context)),
              ),
            ),
            const SizedBox(height: 20),

            StreamBuilder<List<CartItem>>(
              stream: cartViewModel.cartItems,  
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());  
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No items in the cart", style: TextHelper.bodyTextStyle(context)));
                }

                final cartItems = snapshot.data!;  // Lấy danh sách sản phẩm trong giỏ hàng

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Container(
                      padding: const EdgeInsets.all(15),
                      child: Material(
                        color: Theme.of(context).cardColor,
                        shadowColor: Theme.of(context).shadowColor,
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 9,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).cardColor),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Theme.of(context).primaryColor), 
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text(item.quantity.toString(), style: TextHelper.bodyTextStyle(context))),
                              ),
                              const SizedBox(width: 10),
                              ClipRRect(
                                child: Image.network(item.product.imageUrl, fit: BoxFit.cover), 
                              ),
                              const SizedBox(width: 10),
                              Text("\$${item.totalPrice}", style: TextHelper.bodyTextStyle(context)),
                              const Spacer(),
                              IconButton(
                                icon: Icon(Icons.add, color: Theme.of(context).colorScheme.secondary),
                                onPressed: () => cartViewModel.updateQuantity(item.product.id, true),
                              ),
                              IconButton(
                                icon: Icon(Icons.remove, color: Theme.of(context).colorScheme.secondary),
                                onPressed: () => cartViewModel.updateQuantity(item.product.id, false),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_forever, color: Theme.of(context).colorScheme.secondary),
                                onPressed: () => cartViewModel.removeItem(item.product.id),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const Spacer(),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price", style: TextHelper.bodyTextStyle(context)),
                  // Tính tổng giá trị của giỏ hàng
                  StreamBuilder<List<CartItem>>(
                    stream: cartViewModel.cartItems,  
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();  // Chờ dữ liệu
                      }

                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Text("\$0", style: TextHelper.bodyTextStyle(context));  
                      }

                      final cartItems = snapshot.data!;
                      totalPrice = cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

                      return Text("\$${totalPrice.toStringAsFixed(2)}", style: TextHelper.bodyTextStyle(context));  // Hiển thị tổng giá trị
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                cartViewModel.checkout(totalPrice);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Check Out", style: TextHelper.headerTextStyle(context))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
