import 'package:ecommerce_app/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
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
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SPEEDYEATS',
      home: Login(),
    );
  }
}

