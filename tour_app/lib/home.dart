import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data/ToursProvider.dart';
import 'model/Tour.dart';

class Home extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }

}

class HomeState extends State<Home> {

  TourProvider toursProvider = TourProvider();
  Tour currentTour;

  @override
  void initState(){
    super.initState();
    this.currentTour = toursProvider.currentTour();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildGradient()
        ],
      ),
    );
  }

  Widget _buildBackground() {
    BoxDecoration boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
        stops: [0.7, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
      )
    );

    //TODO: remove boxDecoration from here at the end and see if anything changes
    return Container(
      decoration: boxDecoration,
      child: Image.asset(
        this.currentTour.coverImage,
        fit: BoxFit.cover,
        height: double.infinity,
      ),

    );
  }

  Widget _buildGradient(){
    BoxDecoration boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
        stops: [0.3,1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter
      )
    );

    return Container(
      decoration: boxDecoration,
    );
  }

  Widget _buildContentUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currentTour.tourName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 42
          ),
        ),

        SizedBox(height: 4,),

        Row(
          children: [
            //TODO: add rating bar indicator
            Text(
              currentTour.rating,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600
              ),
            )
          ],
        ),

        SizedBox(height: 12,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //TODO: add labels
          ],
        )
      ],
    );
  }
}