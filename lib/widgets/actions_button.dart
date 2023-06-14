import 'package:flutter/material.dart';

/// Кнопки для панели
class ActionsButtons extends StatelessWidget{
  const ActionsButtons({Key? key}):super (key:key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: const Text('Load'),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
          ),
          child: const Text('Clear'),
        ),
      ],
    );
  }
}