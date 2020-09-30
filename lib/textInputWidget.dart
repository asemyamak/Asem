import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: this.controller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange, width: 1.0),
            ),
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message:",
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              splashColor: Colors.pink,
              tooltip: "Post message",
              onPressed: this.click,
            )));
  }
}
