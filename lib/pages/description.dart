import 'package:bid_palour/pages/preview_description.dart';
import 'package:bid_palour/widgets/app_bar.dart';
import 'package:bid_palour/widgets/description_card.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: header(context, titleText: "How it works", balance: 100),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'How it works',
          style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              descriptionCard(
                context,
                scr: 'images/scr_1.jpg',
                origin: 'Home Page',
                id: '1',
                description:
                    "You can click on the 'Bid now' button to bid once, or click anywhere in the card to get more options.",
              ),
              descriptionCard(
                context,
                scr: 'images/scr_2.jpg',
                origin: 'Details Page',
                id: '2',
                description:
                    "ON the next page, you can select home many times you want to bid. Once you are satisfied you can click on 'Bid @ #amt' to place your bid.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
