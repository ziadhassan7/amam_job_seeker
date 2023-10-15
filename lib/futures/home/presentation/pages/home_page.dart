import 'package:flutter/material.dart';
import '../../data/model/geo_model.dart';
import '../manager/location_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(

        child: Column(
          children: [
            Center(
              child: FutureBuilder(
                future: LocationController.getLocationByCity("Cairo"),

                builder: (context, AsyncSnapshot<GeoModel> snapshot) {

                  if(snapshot.hasData){

                    final long = snapshot.data!.longitude;
                    final lat = snapshot.data!.latitude;

                    return Text("Longitude: $long ,Latitude: $lat");

                  } else {
                    return const Center(child: CircularProgressIndicator(),);
                  }

                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
