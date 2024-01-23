import 'package:flutter/material.dart';

class AppBottom extends StatelessWidget {
  const AppBottom({
    super.key,
    required this.text,
    required this.color,
    this.width,
    this.height,
    required this.onPressed});
  final String text;
  final Color color;
  final double? width;
  final VoidCallback onPressed;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          maximumSize: Size(MediaQuery.of(context).size.width, 56),
          minimumSize: Size(MediaQuery.of(context).size.width, 56),
          backgroundColor: color,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          )
        ),
      )
    );
  }
}
