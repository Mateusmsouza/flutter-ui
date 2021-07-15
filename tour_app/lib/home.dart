import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tour_app/widgets/label.dart';
import 'package:tour_app/widgets/transparent_button.dart';

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
    this.currentTour = toursProvider.nextTour();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildGradient(),
          Positioned(child: _buildContentUI(),
          top: MediaQuery.of(context).size.height * 0.45,
          left: 20,
          right: 20,),
          Positioned(child: _buildButtons(),
          left: 40,
          right: 40,
          bottom: 20,)
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
          this.currentTour.tourName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 42
          ),
        ),

        SizedBox(height: 4,),

        Row(
          children: [
            RatingBarIndicator(
              itemCount: 5,
              rating: double.parse(this.currentTour.rating),
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              )
            ),
            Text(
              this.currentTour.rating,
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
            Label(currentTour.tourTime, 'Tour time', Icons.timer),
            Label(currentTour.price, 'Price', Icons.monetization_on_outlined),
            Label(currentTour.placesCount, 'Place', Icons.location_on),
            Label(currentTour.closeHrs, 'Close', Icons.time_to_leave)
          ],
        )
      ],
    );
  }

  Widget _buildButtons(){
    return Column(
      children: [
        TransparentButton(
          text: 'Next',
          onTap: () {
            setState(() {
              this.currentTour = toursProvider.nextTour();
            });
          },
        ),
        SizedBox(height: 12,),
        TransparentButton(
          text: 'Previous',
          onTap: () {
            setState(() {
              this.currentTour = toursProvider.previousTour();
            });
          },
        )
      ],
    );
  }
}