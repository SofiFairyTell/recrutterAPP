import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback onPressed;

  const CustomButton({
    required Key? key,
    required this.firstText,
    required this.secondText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary:Color.fromRGBO(193, 200, 219, 100)
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstText,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(width: 30),
            Text(
              secondText,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.normal,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
