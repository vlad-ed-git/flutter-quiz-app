import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onClick;

  const PrimaryButton(
    {
      Key? key,
      required this.text,
      required this.icon,
      required this.onClick
      }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon : Icon(
          icon,
          color: Colors.black,
          size: 20
        ),
        label: Text(text.toUpperCase(), style: Theme.of(context).textTheme.button),
        onPressed: () => onClick(),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 52),
      ),
      );
  }
}
