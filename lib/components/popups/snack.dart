import 'package:flutter/material.dart';
import 'package:quizme/theme.dart';
class Snack{
  final String content;
  final Function? action;
  final String actionLbl;

  const Snack({Key? key, required this.content, this.action, this.actionLbl = '' });

  SnackBar create() {
    return SnackBar(
           content: Text(content, style: appTheme.textTheme.bodyText1,),
          action: action != null ?  SnackBarAction(
            label: actionLbl,
            onPressed: () => action,
          ) : null,
          backgroundColor: appTheme.primaryColorLight,

        );
  }
}
