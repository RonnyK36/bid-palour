import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/widgets/records_titles.dart';
import 'package:bid_palour/widgets/single_record_card.dart';
import 'package:flutter/material.dart';

class OngoingBids extends StatefulWidget {
  const OngoingBids({Key? key}) : super(key: key);

  @override
  _OngoingBidsState createState() => _OngoingBidsState();
}

class _OngoingBidsState extends State<OngoingBids> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          recordsTitle(),
          SingleRecordCard(
            // winner: 'Ongoing...',
            priceToWin: '500',
            bids: '6',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
          SingleRecordCard(
            // winner: 'Ongoing...',
            priceToWin: '100',
            bids: '1',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
          SingleRecordCard(
            // winner: 'Ongoing...',
            priceToWin: '1000',
            bids: '4',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
          SingleRecordCard(
            // winner: 'Ongoing...',
            priceToWin: '500',
            bids: '3',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
          SingleRecordCard(
            // winner: 'Ongoing...',
            priceToWin: '1000',
            bids: '2',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
          SingleRecordCard(
            // winner: 'Ongoing...',
            priceToWin: '200',
            bids: '9',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
          SingleRecordCard(
            // winner: 'Ongoing...',
            priceToWin: '1850',
            bids: '1',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
          SingleRecordCard(
            // winner: 'Ongoing...',
            priceToWin: '500',
            bids: '3',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
          SingleRecordCard(
            // winner: 'Ongoing...',
            priceToWin: '200',
            bids: '1',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
          SingleRecordCard(
            // winner: 'Ongoing...',
            priceToWin: '500',
            bids: '2',
            date: '17-08-2021',
            ticketNumber: '234456643',
          ),
        ],
      ),
    );
  }
}
