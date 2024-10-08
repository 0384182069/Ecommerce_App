import 'package:ecommerce_app/widgets/my_FontStyle.dart';
import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPasswordField;
  final Icon icon;
  final String? Function(String?)? validatar; 

  const MyTextfield({
    super.key, 
    required this.controller, 
    required this.hintText, 
    required this.isPasswordField, 
    required this.icon, 
    required this.validatar, 
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  bool _isObsure = true;
  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator: widget.validatar,
                controller: widget.controller,
                obscureText: widget.isPasswordField? _isObsure: false,
                style: FontSize.semiBoldTextFeilStyle(),
                decoration: InputDecoration(
                hintStyle: FontSize.semiBoldTextFeilStyle(),
                hintText: widget.hintText,
                prefixIcon: widget.icon,
                suffixIcon: widget.isPasswordField
                ?IconButton(
                  icon: Icon(
                    _isObsure ? Icons.visibility: Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: (){
                    setState(() {
                      _isObsure = !_isObsure;
                    });
                  },
                ): const SizedBox.shrink(),
                ),
              ),
            );
  }
}