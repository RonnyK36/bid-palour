import 'package:bid_palour/config/config.dart';
import 'package:flutter/material.dart';

class ActiveBids extends StatefulWidget {
  const ActiveBids({Key? key}) : super(key: key);

  @override
  _ActiveBidsState createState() => _ActiveBidsState();
}

class _ActiveBidsState extends State<ActiveBids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Bidding on KES 500'),
                  Row(
                    children: [
                      Text('2'),
                      Text('Bids'),
                    ],
                  ),
                  Text(
                    '17-08-2021 9.36 am',
                  ),
                ],
              ),
            ]),
          ),
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