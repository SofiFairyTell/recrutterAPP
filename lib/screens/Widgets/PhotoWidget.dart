import 'package:flutter/material.dart';

class PhotoWidget extends StatelessWidget {
  final String photoUrl;
  final VoidCallback onPressed;

  const PhotoWidget({
    Key? key,
    required this.photoUrl,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: GestureDetector(
        onTap: onPressed,
        child: ClipOval(
          child: Image.asset(
            photoUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
