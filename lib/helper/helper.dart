  import 'package:flutter/material.dart';

void ShowSnakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('week passWord'),
      ),
    );
  }