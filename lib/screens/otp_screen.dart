import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bank/screens/dashboard.dart';
import 'package:my_bank/screens/screen.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../constants.dart';
import 'dart:ui';


const _kInputHeight = 50.0;
const _kDefaultHint = 'abcd';

// ignore: must_be_immutable
class OtpScreen extends StatefulWidget {

  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String smsOTP;

  /// Control the input text field.
  TextEditingController _pinEditingController =
  TextEditingController(text: '123456');

  /// Default max pin length.
  static final int _pinLength = 4;

  /// Control whether show the obscureCode.
  bool _obscureEnable = false;

  PinEntryType _pinEntryType = PinEntryType.underline;
  final ColorBuilder _solidColor =
  PinListenColorBuilder(Colors.grey, Colors.grey);
  bool _solidEnable = false;

  /// Control whether textField is enable.
  bool _enable = true;

  /// Indicate whether the PinInputTextFormField has error or not
  /// after being validated.
  bool _hasError = false;

  bool _cursorEnable = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Image(
            width: 24,
            color: Colors.black,
            image: Svg('assets/images/back_arrow.svg'),
          ),
        ),
      ),
      body: SafeArea(
        //to make page scrollable
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Verification",
                            style: kHeadline,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Enter a 4 digit number that was sent to ',
                            style: kBodyText2,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          PinInputTextField(
                            pinLength: _pinLength,
                            decoration: BoxLooseDecoration(
                              strokeColorBuilder:
                              PinListenColorBuilder(Colors.grey, Colors.grey),
                              bgColorBuilder: _solidEnable ? _solidColor : null,
                              obscureStyle: ObscureStyle(
                                isTextObscure: _obscureEnable,
                                obscureText: '☺️',
                              ),
                              hintText: _kDefaultHint,
                            ),
                            controller: _pinEditingController,
                            textInputAction: TextInputAction.go,
                            enabled: _enable,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.characters,
                            onSubmit: (pin) {
                              debugPrint('submit pin:$pin');
                            },
                            onChanged: (pin) {
                              debugPrint('onChanged execute. pin:$pin');
                            },
                            enableInteractiveSelection: false,
                            cursor: Cursor(
                              width: 2,
                              color: Colors.black,
                              radius: Radius.circular(1),
                              enabled: _cursorEnable,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't received OTP? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => WelcomePage(),
                              ),
                            );
                          },
                          child: Text(
                            'Resend',
                            style: kBodyText.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.resolveWith(
                                (states) => Colors.black12,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Dashboard(),
                              ));
                        },
                        child: Text(
                          'Verify',
                          style: kButtonText.copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
