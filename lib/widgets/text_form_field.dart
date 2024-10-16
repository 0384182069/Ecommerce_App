import 'package:ecommerce_app/utils/text_helper.dart';
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
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                validator: widget.validatar,
                controller: widget.controller,
                obscureText: widget.isPasswordField? _isObscure: false,
                style: TextHelper.bodyTextStyle(context),
                decoration: InputDecoration(
                hintStyle: TextHelper.subtitleTextStyle(),
                hintText: widget.hintText,
                prefixIcon: widget.icon,
                suffixIcon: widget.isPasswordField
                ?IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility: Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: (){
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ): const SizedBox.shrink(),
                ),
              ),
            );
  }
}