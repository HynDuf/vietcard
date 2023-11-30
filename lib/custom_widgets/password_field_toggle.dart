import 'package:flutter/material.dart';

class PasswordFieldWithToggle extends StatefulWidget {
  final TextEditingController controller;
  final String title;

  PasswordFieldWithToggle({
    required this.controller,
    required this.title,
  });

  @override
  _PasswordFieldWithToggleState createState() =>
      _PasswordFieldWithToggleState();
}

class _PasswordFieldWithToggleState extends State<PasswordFieldWithToggle> {
  bool _passwordVisible = false;

  void _onTap() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 3.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              controller: widget.controller,
              obscureText: !_passwordVisible,
              obscuringCharacter: '●',
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    _onTap();
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}