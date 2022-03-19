import 'package:currency_converter_app/utils/colors.dart';
import 'package:flutter/material.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(gradient: primaryLinearGradient),
        child: const Center(
          child: Text(
            'Thank You!',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: headTextColor),
          ),
        ),
      ),
    );
  }
}
