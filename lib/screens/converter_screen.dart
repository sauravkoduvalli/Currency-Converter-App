import 'package:currency_converter_app/screens/data_submit_screen.dart';
import 'package:currency_converter_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CurrencyConvertScreen extends StatefulWidget {
  const CurrencyConvertScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyConvertScreen> createState() => _CurrencyConvertScreenState();
}

class _CurrencyConvertScreenState extends State<CurrencyConvertScreen> {
  final GlobalKey formKey = GlobalKey<FormState>();

  final TextEditingController amountController = TextEditingController();
  final TextEditingController convertedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                decoration:
                    const BoxDecoration(gradient: primaryLinearGradient),
              ),
            ],
          ),
          Positioned(
            bottom: 72,
            left: 20,
            right: 20,
            child: Column(
              children: [
                const Text(
                  'Currency Converter',
                  style: TextStyle(
                    color: headTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.white,
                    child: Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Amount'),
                            const SizedBox(height: 5.0),
                            Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                TextFormField(
                                  controller: amountController,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.done,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter amount',
                                  ),
                                  validator: (value) {
                                    if (value == null) {
                                      return "please enter amount";
                                    }
                                    return null;
                                  },
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: primaryBlue,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, top: 5, bottom: 5),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isExpanded: false,
                                        iconEnabledColor: Colors.white,
                                        iconDisabledColor: Colors.white,
                                        hint: const Text(
                                          'INR',
                                          style:  TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        items: <String>['A', 'B', 'C', 'D']
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (_) {
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15.0),
                            const Text('Convert to'),
                            const SizedBox(height: 5.0),
                            Stack(
                              alignment: Alignment.centerRight,
                              children: [
                                TextFormField(
                                  controller: convertedController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: primaryBlue,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, top: 5, bottom: 5),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isExpanded: false,
                                        iconEnabledColor: Colors.white,
                                        iconDisabledColor: Colors.white,
                                        hint: const Text('USD',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                        items: <String>['A', 'B', 'C', 'D']
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChanged: (_) {},
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: buttonColor,
                                  onPrimary: headTextColor,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const DataSubmitSCreen(),
                                      type: PageTransitionType.fade,
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
