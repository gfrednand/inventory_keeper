import 'package:flutter/material.dart';

/// Add Product Page
class AddProduct extends StatelessWidget {
  ///
  const AddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
