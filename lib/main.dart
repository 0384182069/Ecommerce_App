import 'package:ecommerce_app/view_models/auth_view_model.dart';
import 'package:ecommerce_app/view_models/payment_view_model.dart';
import 'package:ecommerce_app/view_models/themma_view_model.dart';
import 'package:ecommerce_app/views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/.env");
  String? publishableKey = dotenv.env['Publishable_Key'];
  Stripe.publishableKey = publishableKey!;
  
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions( 
        apiKey: "AIzaSyAZMKwhpvBcOomAzIbw5zn1DMS_vedh1vw",
        authDomain: "ecommerceapp-5a835.firebaseapp.com",
        projectId: "ecommerceapp-5a835",
        storageBucket: "ecommerceapp-5a835.appspot.com",
        messagingSenderId: "710412569298",
        appId: "1:710412569298:web:9d9ae0a2fbf37f0a29fb0b",
        measurementId: "G-1BS0SRZ0FG"));
  }else{
    await Firebase.initializeApp();
  }

  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(create: (_) => PaymentViewModel()),
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeViewModel.currentTheme,
      title: 'SPEEDYEATS',
      home: const Login(),
    );
  }
}

