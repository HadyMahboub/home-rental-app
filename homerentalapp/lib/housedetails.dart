import 'package:flutter/material.dart';
import 'totalcost.dart';

class HouseDetailsPage extends StatelessWidget {
  final String image;
  final int price;
  final int numberOfRooms;
  final String location;

  HouseDetailsPage({
    required this.image,
    required this.price,
    required this.numberOfRooms,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('House Details'),centerTitle: true,
      ),
      body:

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image),
                SizedBox(height: 16),
                Text('Price Per Day: \$$price'),
                Text('Rooms: $numberOfRooms'),
                Text('Location: $location'),
                SizedBox(height: 18),
                ElevatedButton(onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>CalculateTotalCost(
                    price:price,
                    image:image,
                    ),
                  )
                  );
                },
                child:Text('Rent House'),
                ),
              ],
            ),
          ),



    );
  }
}
