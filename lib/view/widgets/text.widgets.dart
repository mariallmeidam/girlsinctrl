import 'package:flutter/material.dart';

typedef Validator = String? Function(String? value);

class TextBoxWidget extends StatefulWidget {
  final String? name;
  final TextEditingController txt;
  final TextInputType? type;
  final Validator validator;
  final bool obscure;
  final bool showIcon;

  TextBoxWidget({
    required this.name,
    required this.txt,
    this.type,
    required this.validator,
    required this.obscure,
    required this.showIcon,
  });

  @override
  _TextBoxWidgetState createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      controller: widget.txt,
      validator: widget.validator,
      obscureText: widget.obscure && (widget.showIcon ? !show : false),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide(
            width: 0,
            color: Colors.black12,
          ),
        ),
        filled: true,
        fillColor: Colors.black12,
        hintText: widget.name,
        errorStyle: TextStyle(
          height: 0.8,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        suffixIcon: (widget.obscure && widget.showIcon)
            ? GestureDetector(
                child: Icon(
                  show == false
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.black54,
                ),
                onTap: () {
                  setState(() {
                    show = !show;
                    print('Show password: $show');
                  });
                },
              )
            : null,
      ),
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.left,
      maxLines: 1,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
