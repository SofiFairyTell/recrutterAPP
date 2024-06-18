import 'package:flutter/material.dart';
import 'package:recrutterapp/widgets/criteriontable_widget.dart';

class DataTableVisible {
  final bool isVisible;

  DataTableVisible({required this.isVisible});
}

class DataTableWidget extends StatelessWidget {
  final bool isVisible;
  final void Function()? onPressed;

  DataTableWidget({
    Key? key,
    required this.isVisible,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      color: const Color(0xFFB9C2D7),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Visibility(visible:isVisible,
               child: CriterionTable())

        ],
      ),
    );
  }

}
