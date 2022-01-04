import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:my_bank/screens/appointment.dart';
import 'package:my_bank/widgets/my_text_field.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../constants.dart';

class Deposit extends StatefulWidget {
  const Deposit({Key? key}) : super(key: key);

  @override
  _DepositState createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  @override
  Widget build(BuildContext context) {
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
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Deposit",
                            style: kHeadline,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          MyTextField(
                            hintText: 'Account Name',
                            inputType: TextInputType.name,
                          ),
                          MyTextField(
                            hintText: 'Amount (In Word)',
                            inputType: TextInputType.number,
                          ),
                          MyTextField(
                            hintText: 'Depositor\'s Name',
                            inputType: TextInputType.text,
                          ),
                          MyTextField(
                            hintText: 'Depositor\'s Address',
                            inputType: TextInputType.text,
                          ),
                          MyTextField(
                            hintText: 'Depositor\'s Phone',
                            inputType: TextInputType.phone,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ///BottomSheet Mode with no searchBox
                          DropdownSearch<String>(
                            mode: Mode.BOTTOM_SHEET,
                            items: const [
                              "Banani",
                              "Mohakhali",
                              "Badda",
                              'Uttara',
                              'Mohammodpur',
                              'Mirpur',
                              'Abdullahpur',
                              'Gabtoli',
                              'Ashkona'
                            ],
                            dropdownSearchDecoration: const InputDecoration(
                              labelText: "Branch Name",
                              contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: print,
                            selectedItem: "Banani",
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                                labelText: "Search a branch",
                              ),
                            ),
                            popupTitle: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorDark,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Branch List',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            popupShape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                builder: (context) => Appointment(),
                              ));
                        },
                        child: Text(
                          'Deposit',
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
