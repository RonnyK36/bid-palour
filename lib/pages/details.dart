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
      body: ListView(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
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
                  SizedBox(
                    height: 5,
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
                        child: Text('Bid and win x10'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text('Spend: $spend'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('View more'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('Bid now'),
                        ),
                      ],
                    ),
                    // child: reusableButton(
                    // onPressed: () {}, buttonName: "Bid @ $deduction"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
