import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/widgets/records_titles.dart';
import 'package:bid_palour/widgets/single_record_card.dart';
import 'package:flutter/material.dart';

class EndedBids extends StatefulWidget {
  const EndedBids({Key? key}) : super(key: key);

  @override
  _EndedBidsState createState() => _EndedBidsState();
}

class _EndedBidsState extends State<EndedBids> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          recordsTitle(),
          SingleRecordCard(
            // winner: '072****456',
            priceToWin: '500',
            bids: '3',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
        ],
      ),
    );
  }
}
