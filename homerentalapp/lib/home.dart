import 'package:flutter/material.dart';
import 'housedetails.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _locations = ['Please choose a location','Jbeil', 'Beirut', 'Bcharre', 'Zgharta','Tripoli'];
  String? _selectedLocation;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title: Text('Home Renting App'), centerTitle:true),
        body:Column(
          children: <Widget>[

                Center(
               child: DropdownButton(
                  hint: Text('Please choose a location'),
                  value: _selectedLocation,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLocation = newValue as String?;
                    });
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child: Text(location),
                      value: location,
                    );
                  }).toList(),
      ),

              ),



            Expanded(


                child: Row(
                  children: <Widget>[
                    Expanded(
                    child:



                    HouseCard(image:'images/house1.jpg',
                        price:500,
                        numberOfRooms:10,
                        location:'Jbeil',
                    selected: _selectedLocation=='Jbeil',
                      ),

                    ),
                    Expanded(child:

                    HouseCard(image:'images/house2.jpeg',
                        price:1000,
                        numberOfRooms:12,
                        location:'Beirut',
                        selected:_selectedLocation=='Beirut',
                      ),

                    ),

                    Expanded(child: HouseCard(image:'images/house3.jpg',
                        price:750,
                        numberOfRooms:9,
                        location:'Beirut',
                        selected: _selectedLocation=='Beirut',
                      ),
                    )





                  ],
                ),
              ),


            Expanded(



                child: Row(
                  children: <Widget>[

                    Expanded(
                      child: HouseCard(image:'images/house4.jpg',
                        price:650,
                        numberOfRooms:9,
                        location:'Bcharre',
                          selected: _selectedLocation=='Bcharre',
                        ),
                    ),


                    Expanded(child: HouseCard(image:'images/house5.jpg',
                        price:500,
                        numberOfRooms:8,
                        location:'Zgharta',
                        selected: _selectedLocation=='Zgharta',
                      ),
                    ),


                    Expanded(child: HouseCard(image:'images/house6.jpg',
                        price:500,
                        numberOfRooms:7,
                        location:'Tripoli',
                        selected: _selectedLocation=='Tripoli',
                      ),
                    )
                  ],
                ),

              ),


            Expanded(



                child: Row(
                  children: <Widget>[

                    Expanded(child: HouseCard(image:'images/house7.jpg',
                        price:700,
                        numberOfRooms:7,
                        location:'Jbeil',
                        selected: _selectedLocation=='Jbeil',
                      ),
                    ),

                    Expanded(child:


                    HouseCard(image:'images/house8.jpg',
                        price:1200,
                        numberOfRooms:14,
                        location:'Beirut',
                        selected: _selectedLocation=='Beirut',
                      ),
                    ),


                    Expanded(child:


                    HouseCard(image:'images/house9.jpg',
                        price:800,
                        numberOfRooms:9,
                        location:'Tripoli',
                        selected: _selectedLocation=='Tripoli',
                     ),
                    ),

                  ],
                ),


              ),



          ],
        ),
    )
    );




  }
}

class HouseCard extends StatelessWidget {
  final String image;
  final int price;
  final int numberOfRooms;
  final String location;
  final bool selected;



  HouseCard({
    required this.image,
    required this.price,
    required this.numberOfRooms,
    required this.location,
    required this.selected,


  });



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HouseDetailsPage(
              image: image,
              price: price,
              numberOfRooms: numberOfRooms,
              location: location,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        color: selected ? Colors.green : null,
        child: Column(

          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.vertical( top:Radius.circular(8.0)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RentPerDay: \$$price',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rooms: $numberOfRooms',
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Location: $location',
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
