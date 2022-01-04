import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:my_bank/screens/dashboard.dart';
import 'package:my_bank/widgets/my_text_field.dart';

import '../constants.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Appointment",
                            style: kHeadline,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Time:",
                            style: kBodyText,
                          ),
                          Text(
                            "12 Jan, 2022 12:30 PM",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Serial No:",
                            style: kBodyText,
                          ),
                          Text(
                            "101",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 60,
                          width: screenWidth * 0.35,
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
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Home',
                              style: kButtonText.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          height: 60,
                          width: screenWidth * 0.35,
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

                            },
                            child: Text(
                              'Share',
                              style: kButtonText.copyWith(color: Colors.white),
                            ),
                          ),
                        )
                      ],
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
