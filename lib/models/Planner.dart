import 'package:flutter/material.dart';

class Planner {
  final String nama;
  final String start_at;
  final String end_at;

  const Planner(
      {required this.nama,
      required this.start_at,
      required this.end_at});
  factory Planner.fromJson(Map <String, dynamic> json){
    return Planner(
      nama: json['nama'],
      start_at: json['start_at'],
      end_at: json['end_at']
    );
  }
}

class Task{
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  List<Map<String, dynamic>>? desc;
  bool isLast;
  Task({this.iconData, this.title, this.bgColor, this.iconColor,
  this.left, this.done, this.desc, this.isLast = false});
  static List<Task> generatePlan() {
    return[
      Task(
        iconData: Icons.person_rounded,
        title: 'Plan',
        bgColor: Colors.blue,
        iconColor: Colors.yellowAccent,
        left: 3,
        done: 1,
        desc: [
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
        ]
      ),
     Task(
        iconData: Icons.person_rounded,
        title: 'Plan',
        bgColor: Colors.blue,
        iconColor: Colors.yellowAccent,
        left: 3,
        done: 1,
      ),
      Task(
        iconData: Icons.person_rounded,
        title: 'Plan',
        bgColor: Colors.blue,
        iconColor: Colors.yellowAccent,
        left: 3,
        done: 1,
      ),
      Task(
        iconData: Icons.person_rounded,
        title: 'Plan',
        bgColor: Colors.blue,
        iconColor: Colors.yellowAccent,
        left: 3,
        done: 1,
      ),
      Task(
        iconData: Icons.person_rounded,
        title: 'Plan',
        bgColor: Colors.blue,
        iconColor: Colors.yellowAccent,
        left: 3,
        done: 1,
      ),
      Task(
        iconData: Icons.person_rounded,
        title: 'Plan',
        bgColor: Colors.blue,
        iconColor: Colors.yellowAccent,
        left: 3,
        done: 1,
      ),
      Task(isLast:true)
    ];
  }
}