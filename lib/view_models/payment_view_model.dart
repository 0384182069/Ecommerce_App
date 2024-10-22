import 'package:ecommerce_app/services/cloud_store.dart';
import 'package:ecommerce_app/services/payment_service.dart';
import 'package:ecommerce_app/view_models/auth_view_model.dart';
import 'package:ecommerce_app/views/wallet_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ecommerce_app/utils/toast_helper.dart';
import 'package:provider/provider.dart';


class PaymentViewModel extends ChangeNotifier {
  final StripeService _stripeService = StripeService();
  Map<String, dynamic>? paymentIntent;
  bool isLoading = false;
  


  Future<void> makePayment(String amount, BuildContext context) async {
    isLoading = true;
    notifyListeners();

    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final user = authViewModel.user;

    try {
      paymentIntent = await _stripeService.createPaymentIntent(amount, "USD");

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          appearance: PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: Theme.of(context).colorScheme.secondary,
              primaryText: Theme.of(context).colorScheme.primary,
              background: Theme.of(context).primaryColor,
              icon: Theme.of(context).colorScheme.primary,
            ),
            shapes: const PaymentSheetShape(
              borderRadius: 10,
              shadow: PaymentSheetShadowParams(color: Colors.black),
            ),
          ),
          merchantDisplayName: 'SPEEDY EAT',
        ),
      );
      await displayPaymentSheet();
      await CloudStore().updateWallet(user!.uid, amount);
    } catch (e) {
      print("Exception: $e");
      ToastHelper.showToast("Payment failed", Colors.red);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      ToastHelper.showToast("Successful Payment", Colors.green);
      paymentIntent = null; 
    } on StripeException catch (e) {
      print("Error is: $e");
      ToastHelper.showToast("Cancel Payment", Colors.red);
    } catch (e) {
      print("Error is: $e");
      ToastHelper.showToast("Unforeseen error: $e", Colors.red);
    }
  }
}
