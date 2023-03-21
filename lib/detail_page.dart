import 'package:flutter/material.dart';
import 'rental_car.dart';

class HalamanDetail extends StatelessWidget {
  final RentalCar rental;
  HalamanDetail({Key? key, required this.rental}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool ketersediaan = rental.available;
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text(rental.brand + " " + rental.model),
      ),),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SizedBox(height: 30,),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width / 3,
            height: MediaQuery
                .of(context)
                .size
                .height / 3,
            child: Center(
              child: Image.network(rental.images[0]),
            ),
          ),
          SizedBox(height: 30,),
          Center(child: Text(rental.brand + " " + rental.model,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),),
          SizedBox(height: 30,),
          Text("Brand          : " + rental.brand),
          Text("Model          : " + rental.model),
          Text("Tahun          : " + rental.year.toString()),
          Text("Harga          : " + rental.rentalPricePerDay + "/hari"),
          Text("Ketersediaan   : " + ketersediaan.toString()),

          SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            String text = "";
            if (ketersediaan == true) {
              text = "Mobil Berhasil Dipesan";
            }
            else {
              text = "Mobil Gagal Dipesan";
            };
            SnackBar snackBar = SnackBar(content: Text(text), backgroundColor: ketersediaan ? Colors.green :Colors.red,);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
              child: Text("Pesan")),

          SizedBox(height: 30,),
          Text("Description"),
          Text(rental.description)
        ],
      ),
    );
  }
}
