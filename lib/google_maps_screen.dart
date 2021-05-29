import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

  final CameraPosition cameraPosition = CameraPosition(target: LatLng(17.385044,78.486671));
  GoogleMapController mapController;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
         children: [
           SizedBox(height: 50,),
         SearchMapPlaceWidget(
         apiKey: "AIzaSyDW5mu20RhikvwlU-uzOn4NH_Y1wgr8I5c",
         placeholder: "searchsss",
        // strictBounds: false,
         //  hasClearButton: false,

         // The language of the autocompletion
         language: 'en',
         // The position used to give better recomendations. In this case we are using the user position
         location: LatLng(17.385044,78.486671),
         radius: 30000,
         onSelected: (Place place) async {
           final geolocation = await place.geolocation;

           // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
         //  final GoogleMapController controller = await mapController.future;
           mapController.animateCamera(CameraUpdate.newLatLng(geolocation.coordinates));
           mapController.animateCamera(CameraUpdate.newLatLngBounds(geolocation.bounds, 0));
         },
       ),
       Expanded(
         child: GoogleMap(
    initialCameraPosition: cameraPosition,
    mapType:MapType.normal,
             onMapCreated: (controller){
               setState(() {
                 mapController = controller;
               });

             },onTap: (cordinates){
           mapController.animateCamera(CameraUpdate.newLatLng(cordinates));
         }

    ),
       )
         ],
       ),
     );

  }
}