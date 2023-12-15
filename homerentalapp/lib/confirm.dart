import 'package:flutter/material.dart';

class ConfirmBuying extends StatelessWidget {
  final String image;
  final int totalPrice;
  final DateTime arrivalDate;
  final DateTime departureDate;

  const ConfirmBuying({
    required this.image,
    required this.totalPrice,
    required this.arrivalDate,
    required this.departureDate,
  });

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Final Details'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(height: 18),
            if (totalPrice != 0)
              Text(
                'You have successfully rented this house from ${formatDate(arrivalDate)} till ${formatDate(departureDate)}.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            if (totalPrice != 0)
              SizedBox(height: 18),
            if (totalPrice != 0)
              Text(
                'Your total payment is $totalPrice\$',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            if (totalPrice == 0)
              Text("Process Failed!! You didn't rent this house"),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
