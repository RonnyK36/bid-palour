import 'package:flutter/material.dart';

Card descriptionCard(
  context, {
  required String id,
  required String description,
  required String origin,
  required String scr,
}) {
  return Card(
    elevation: 0,
    child: Container(
      height: 380,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.green[100],
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
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                'Step $id',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.green[200],
                image: DecorationImage(
                  image: AssetImage(scr),
                ),
              ),
            ),
            Text(
              origin,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
