import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rental_car.dart';
import 'detail_page.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(
        child: const Text("Rental Mobil"),
      ),
      ),
      body: ListView.builder(
        itemCount: rentalCar.length,
          itemBuilder: (context, index){
          final RentalCar rental = rentalCar[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => HalamanDetail(rental: rental),),);
            },
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: MediaQuery.of(context).size.height/3,
                    child: Image.network(rental.images[0], fit:BoxFit.fill),
                  ),
                  SizedBox(width: 30),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(rental.brand + " " +rental.model, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                        Text(rental.rentalPricePerDay +" / hari",),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
          },
      ),
    );
  }
}
