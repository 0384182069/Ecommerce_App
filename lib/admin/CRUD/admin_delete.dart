import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/utils/text_helper.dart';
import 'package:ecommerce_app/utils/toast_helper.dart';
import 'package:flutter/material.dart';

class AdminDelete {
  /// Hiển thị thông báo xác nhận và xóa sản phẩm nếu người dùng đồng ý.
  static Future<void> deleteProduct({
    required BuildContext context,
    required String productId,
    required VoidCallback onDeleted,
  }) async {
    // Hiển thị hộp thoại xác nhận
    final bool? confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm',style: TextHelper.headerTextStyle(context),),
          content: Text('Are you sure to delete this product?',style: TextHelper.bodyTextStyle(context),),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), 
              child: Text('Cancel',style: TextHelper.bodyTextStyle(context),),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true), 
              child: Text('Delete',style: TextHelper.bodyTextStyle(context),),
            ),
          ],
        );
      },
    );

    if (confirm != true) return;

    try {
      await FirebaseFirestore.instance.collection('Products').doc(productId).delete();
      onDeleted(); 
    } catch (e) {
      ToastHelper.showToast("Lỗi không thể xóa sản phẩm $e", Colors.red);
    }
  }
}
