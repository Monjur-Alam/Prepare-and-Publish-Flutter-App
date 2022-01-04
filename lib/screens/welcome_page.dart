import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/screen.dart';
import '../widgets/widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: const Image(
                          image:
                              AssetImage('assets/images/team_illustration.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Enterprise team\ncollaboration.",
                      style: kHeadline,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                        "Bring together your files, your tools, project and people.Including a new mobile and desktop application.",
                        style: kBodyText,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.grey,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => RegisterPage(),
                                ));
                          },
                          child: Text(
                            'Register',
                            style: kButtonText.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.grey,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SignInPage(),
                              ));
                        },
                        child: Text(
                          'Sign In',
                          style: kButtonText.copyWith(color: Colors.white),
                        ),
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
