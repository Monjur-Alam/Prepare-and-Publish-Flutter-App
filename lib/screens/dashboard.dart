import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bank/screens/deposit.dart';
import 'package:my_bank/screens/withdrawal.dart';

import '../constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Hi, Ghulam",
                                    style: kBodyText2,
                                  ),
                                  Text(
                                    "Welcome Back!",
                                    style: kBodyText,
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('assets/images/user.png')
                                // child: Image(image: AssetImage('assets/images/debit-cards.png')),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                // ignore: prefer_const_literals_to_create_immutables
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 6.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(width: 40, color: Colors.white, image: AssetImage('assets/images/debit-cards.png')),
                                SizedBox(
                                  height: screenHeight * 0.01,
                                ),
                                Text(
                                    "6453 4573 2534 4536",
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white)
                                ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Card Holder",
                                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: screenHeight * 0.001,
                                        ),
                                        Text(
                                          "Ghulam",
                                          style: kBodyTextWhite,
                                        ),
                                      ],
                                    ),
                                    Image(image: AssetImage('assets/images/visa.png')),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Text(
                            "Balance",
                            style: kBodyText,
                          ),
                          const Text(
                            "10,000 Tk",
                            style: kBodyText2,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const Withdrawal(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: screenWidth * 0.41,
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        const BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                      Image(color: Colors.white,image: AssetImage('assets/images/money-withdrawal.png')),
                                      SizedBox(
                                        height: screenHeight * 0.01,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: screenWidth * 0.30,
                                        child: const Text(
                                          "Withdrawal",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => const Deposit(),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: screenWidth * 0.41,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                      color: Colors.cyan,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        const BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 1.0), //(x,y)
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(20.0)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                      Image(color: Colors.white,image: AssetImage('assets/images/deposit.png')),
                                      SizedBox(
                                        height: screenHeight * 0.01,
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: screenWidth * 0.30,
                                        child: const Text(
                                          "Deposit",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
