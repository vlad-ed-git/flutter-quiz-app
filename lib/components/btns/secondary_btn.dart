import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function onClick;

  const SecondaryButton(
      {
        Key? key,
        required this.text,
        required this.onClick
      }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(text.toUpperCase(), style: Theme.of(context).textTheme.button),
      onPressed: () => onClick(),
    );
  }
}
