import 'package:bid_palour/pages/preview_description.dart';
import 'package:bid_palour/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: "How it works", balance: 100),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Card(
                elevation: 0,
                child: Container(
                  height: 360,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.green[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Text(
                            'Step 1',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You can click on the 'Bid now' button to bid once, or click anywhere in the card to get more options",
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.green[200],
                            image: DecorationImage(
                              image: AssetImage('images/scr_1.jpg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
