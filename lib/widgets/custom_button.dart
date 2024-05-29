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
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(193, 200, 219, 100),
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Скругленные углы
      ),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              firstText,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              secondText,
              textAlign: TextAlign.left,
              style: const TextStyle(
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
