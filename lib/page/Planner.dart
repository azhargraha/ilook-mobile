import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:planner/models/plan.dart';
import 'package:planner/page/DatePicker.dart';
import 'package:planner/page/TaskTimeline.dart';
import 'package:planner/page/TaskTitle.dart';
import 'package:planner/models/plan.dart';
final List<Map<String, dynamic>> stringList = [
  {
            'time' : '10.00 am',
            'title': 'ke Bandung',
            'slot' : '10.00 - 12.00 am',
            'tlColor' : Colors.redAccent,
            'bgColor' : Colors.white,
          },
          {
            'time' : '12.00 am',
            'title': 'ke Bandung',
            'slot' : '12.00 - 13.00 am',
            'tlColor' : Colors.lightBlue,
            'bgColor' : Colors.white,
          },
];
class Planner extends StatefulWidget {
  

  @override
  State<Planner> createState() => _PlannerState();
}

class _PlannerState extends State<Planner> {
 
  @override
  Widget build(BuildContext context) {
    final detialList = stringList;
    return SafeArea(
      child: Scaffold (
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers:[
          _buildAppBar(context),
          SliverToBoxAdapter(

            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [DatePicker(),TaskTitle()],
        
                ),
              ),
            ),
        
          detialList == null ?
          SliverFillRemaining(
            child: Container(
              color: Colors.white,
              child: Center(child: Text('No Planner has been added',
            style: TextStyle(color: Colors.grey, fontSize: 18))))  
        )
        : 
          SliverList(
            delegate: SliverChildBuilderDelegate(
            (_, index) => TaskTimeLine(detialList[index]),
            childCount: detialList.length),
          ),
        ])
    ));
}

  Widget _buildAppBar(BuildContext context){
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed:() => Navigator.of(context).pop(),
        icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        iconSize: 20,
        ),
        actions: [
          Icon(
            Icons.more_vert, color: Colors.black,
            size: 40,
          )
        ],
        flexibleSpace: FlexibleSpaceBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Planner title',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
              SizedBox(height: 5),
              Text(
                'Bandung',
                style: TextStyle(fontSize: 12, color: Colors.black
                )
          )],
        ),
    ));
  }
}
