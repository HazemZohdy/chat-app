import 'package:flutter/material.dart';
 
class customBottom extends StatelessWidget {
    customBottom({this.ontap ,required this.bottom});
    String bottom;
    VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          bottom,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
