import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/widgets/records_titles.dart';
import 'package:flutter/material.dart';

class SingleRecordCard extends StatelessWidget {
  SingleRecordCard({
    required this.bids,
    required this.priceToWin,
    required this.date,
    required this.ticketNumber,
    // required this.winner,
  });

  final String bids;
  final String priceToWin;
  final String date;
  final String ticketNumber;
  // final String winner;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Ticket no: ',
                //       style: kRecordCardTextStyle,
                //     ),
                //     Text(
                //       ticketNumber,
                //       style: kAccountText,
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: kRecordCardTextStyle,
                    ),
                    Text(
                      'KES $priceToWin',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      bids,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      ticketNumber,
                      // style: kButtonTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
