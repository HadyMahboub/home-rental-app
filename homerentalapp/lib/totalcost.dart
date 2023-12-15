import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'confirm.dart';

class CalculateTotalCost extends StatefulWidget {
  final int price;
  final String image;


  const CalculateTotalCost({
    required this.price,
    required this.image,

  });

  @override
  _CalculateTotalCostState createState() => _CalculateTotalCostState();
}

class _CalculateTotalCostState extends State<CalculateTotalCost> {
  TextEditingController arrivalDateController = TextEditingController();
  TextEditingController departureDateController = TextEditingController();
  DateTime arrivalDate = DateTime.now();
  DateTime departureDate = DateTime.now();
  int totalPrice = 0;



  Future<void> _selectDate(BuildContext context, bool isArrivalDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isArrivalDate ? arrivalDate : departureDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isArrivalDate) {
          arrivalDate = picked;
          arrivalDateController.text = formatDate(arrivalDate);
        } else {
          departureDate = picked;
          departureDateController.text = formatDate(departureDate);
        }
      });
    }
  }

  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
  void calculateTotalPrice() {
    if (departureDate.isAfter(arrivalDate)) {
      int numberOfDays = departureDate.difference(arrivalDate).inDays;
      totalPrice = widget.price * numberOfDays;
    } else {
      totalPrice = 0;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Cost'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(widget.image),
              SizedBox(height: 18),
              Text('Price Per Day: \$${widget.price}'),
              SizedBox(height: 18),
              ElevatedButton(
                onPressed: () => _selectDate(context, true),
                child: Text('Select Arrival Date'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: arrivalDateController,
                readOnly: true,
                decoration: InputDecoration(labelText: 'Arrival Date'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _selectDate(context, false),
                child: Text('Select Departure Date'),
              ),

              SizedBox(height: 10),
              TextField(
                controller: departureDateController,
                readOnly: true,
                decoration: InputDecoration(labelText: 'Departure Date'),
              ),
              SizedBox(height: 10),
              Text('Total Price: \$$totalPrice'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    calculateTotalPrice();
                  });
                },
                child: Text('Calculate Price'),
              ),
              ElevatedButton(
                onPressed: () {
                  calculateTotalPrice();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmBuying(
                          image: widget.image,
                          totalPrice: totalPrice,
                          arrivalDate: arrivalDate,
                          departureDate: departureDate,
                        ),
                      ),
                    );

                },
                child: Text('Confirm Rent'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
