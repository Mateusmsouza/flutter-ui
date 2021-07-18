import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }

}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF3F6FF),
        iconTheme: IconThemeData(
          color: Colors.indigo
        ),
        elevation: 0,
        leading: Icon(Icons.drag_handle),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.calendar_today),
          )
        ],
      ),
      backgroundColor: Color(0xffF3F6FF),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: _buildHeaderSection(),
        )
      ],
    );
  }

  _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 28,
        right: 28,
        top: 16,
        bottom: 8
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back!',
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            'Doctor Peterson',
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 36,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}