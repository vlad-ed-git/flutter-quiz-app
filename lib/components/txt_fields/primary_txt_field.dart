import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PrimaryTxtField extends StatelessWidget {
  final IconData icon;
  final String labelTxt;
  final int? maxLen;
  final String hintTxt;
  final Function onTxtChanged;
  final String? prefixTxt;
  final String? error;
  final bool isHidden;
  final Pattern? allowOnly;
  final TextInputType keyType;

  const PrimaryTxtField({Key? key,
    required this.icon,
    required this.labelTxt,
    required this.onTxtChanged,
    required this.keyType,
    this.hintTxt = "",
    this.prefixTxt,
    this.allowOnly,
    this.error,
    this.maxLen,
    this.isHidden = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (val){onTxtChanged(val);},
      decoration: InputDecoration(
          errorText: error != null && error != "" ? error : null,
          prefixIcon: Icon(
            icon,
          ),
          hintText: hintTxt,
          prefixText: prefixTxt,
          labelText: labelTxt
      ),
      obscureText: isHidden,
      obscuringCharacter: '*',
      keyboardType: keyType,
      maxLength: maxLen,
      inputFormatters: allowOnly != null ? [
        FilteringTextInputFormatter.allow(allowOnly!)
      ] : null,
    );
  }
}
