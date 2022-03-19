import 'package:currency_converter_app/screens/thank_you_screen.dart';
import 'package:currency_converter_app/utils/colors.dart';
import 'package:currency_converter_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class DataSubmitSCreen extends StatefulWidget {
  const DataSubmitSCreen({Key? key}) : super(key: key);

  @override
  State<DataSubmitSCreen> createState() => _DataSubmitSCreenState();
}

class _DataSubmitSCreenState extends State<DataSubmitSCreen> {
  final GlobalKey formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


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
                  'Data Submitter',
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
                            const Text('Name'),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                // hintText: 'Enter your email',
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "please enter your name";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15.0),
                            const Text('Email'),
                            const SizedBox(height: 5.0),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                // hintText: 'Enter your email',
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "please enter your email";
                                } else if (!emailValidatorRegExp
                                    .hasMatch(value)) {
                                  return 'enter valid email address';
                                }
                                return null;
                              },
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
                                      child: const ThankYouScreen(),
                                      type: PageTransitionType.fade,
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Submit',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
