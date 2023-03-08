import 'package:flutter/material.dart';
import 'mc_router.dart';

class SecondPage extends StatelessWidget {
  final String params;

  const SecondPage({Key? key, this.params = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: const Text('第二个页面'),
        onTap: () {
          print('Params: $params');
          var result = 'Ack from secondPage';

          router.popRoute();
        });
  }
}
