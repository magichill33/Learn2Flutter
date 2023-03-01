import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final Map arguments;

  const FormPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("表单"),
      ),
      body: Center(
        child: Text("表单页面:${this.widget.arguments}"),
      ),
    );
  }
}
