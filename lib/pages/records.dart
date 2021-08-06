import 'package:bid_palour/config/config.dart';
import 'package:bid_palour/pages/ended_bids.dart';
import 'package:bid_palour/pages/ongoing_bids.dart';
import 'package:flutter/material.dart';

class Records extends StatefulWidget {
  const Records({Key? key}) : super(key: key);

  @override
  _RecordsState createState() => _RecordsState();
}

class _RecordsState extends State<Records> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bid Records'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          labelPadding: EdgeInsets.symmetric(horizontal: 30),
          tabs: [
            Text('Active'),
            Text('Ended'),
          ],
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          OngoingBids(),
          EndedBids(),
        ],
      ),
    );
  }
}

//  Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 100,
//               width: double.infinity,
//               // color: Colors.green,
//               child: Card(
//                 elevation: 5,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       'Your current Balance:',
//                       style: kAccountText,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Ksh. ',
//                           style: TextStyle(
//                             fontSize: 17,
//                           ),
//                         ),
//                         Text(
//                           '100',
//                           style: TextStyle(
//                             fontSize: 40,
//                             color: Colors.green,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
