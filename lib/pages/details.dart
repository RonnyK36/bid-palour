import 'package:bid_palour/widgets/app_bar.dart';
import 'package:bid_palour/widgets/bid_multiplier.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String image;
  final int deduction;
  Details({
    required this.image,
    required this.deduction,
  });
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<bool> isSelected = [
    true,
    false,
    false,
    false,
  ];
  int spend = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header(context, titleText: 'Win x10', balance: 100),
      body: ListView(
        children: [
          Container(
            height: 600,
            width: double.infinity,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 0,
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.image),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Bid this number of times: ',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      color: Colors.white,
                      child: ToggleButtons(
                        isSelected: isSelected,
                        fillColor: Colors.green.withOpacity(0.7),
                        selectedBorderColor: Colors.white,
                        selectedColor: Colors.white,
                        color: Colors.black,
                        renderBorder: true,
                        splashColor: Colors.red.withOpacity(0.5),
                        onPressed: (int selectedIndex) {
                          setState(() {
                            for (int index = 0;
                                index < isSelected.length;
                                index++) {
                              if (index == selectedIndex) {
                                isSelected[index] = true;
                                print('Multiplying by: ${index + 2}');
                                spend = (index + 2) * widget.deduction;
                              } else {
                                isSelected[index] = false;
                              }
                            }
                          });
                        },
                        children: [
                          bidMultiplierButton(times: 2),
                          bidMultiplierButton(times: 3),
                          bidMultiplierButton(times: 4),
                          bidMultiplierButton(times: 5),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            top: 8,
                          ),
                          child: Text(
                            'Bid and win KES ${widget.deduction * 10}.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              Text(
                                'Spend: ',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$spend',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.green.withOpacity(0.5),
                      //  Invoice - Spending, check balance
                    ),
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          // 'Bid now @ ${widget.deduction.toString()}/bid',
                          'Bid now @ $spend',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      // child: reusableButton(
                      // onPressed: () {}, buttonName: "Bid @ $deduction"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
