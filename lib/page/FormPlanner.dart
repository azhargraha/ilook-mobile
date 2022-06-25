import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilook/services/plannerServices.dart';
import 'package:http/http.dart' as http;

import '../services/globals.dart';
class FormPlanner extends StatefulWidget {
  const FormPlanner({ Key? key }) : super(key: key);

  @override
  State<FormPlanner> createState() => _FormPlannerState();
}

class _FormPlannerState extends State<FormPlanner> {
  DateTimeRange dateRange = DateTimeRange(start: DateTime.now(), end: DateTime(2023));
  String _name = '';

  Future<void> createPlannerPressed() async {
    if (_name.isNotEmpty){
      http.Response response =
        await PlannerServices.createPlan(_name, dateRange.start, dateRange.end);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('success');
        Navigator.pop(context);
      } else {
        errorSnackBar(context, responseMap['message']);
      }
    }else {
      errorSnackBar(context, 'Some fields are missing');
    }
  }

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: SvgPicture.asset('assets/logo.svg',
          height: AppBar().preferredSize.height * 0.7),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        width: screen.width,
        height: screen.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Planner Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                  TextFieldContainer(
                    child: TextField(
                      onChanged: (value) {
                        _name = value;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Planner Name'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Start Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: pickDateRange, 
                    child: Text('${start.year}/${start.month}/${start.day}', style: TextStyle(fontSize: 22),)
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'End Date',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: pickDateRange, 
                    child: Text('${end.year}/${end.month}/${end.day}', style: TextStyle(fontSize: 22),
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 35),
                    height: screen.height * 0.06,
                    width: screen.width * 0.8,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () => createPlannerPressed(),
                      child: Text(
                        'Add Plan',
                        style: TextStyle(fontSize: 18),
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange, 
      firstDate: DateTime.now(), 
      lastDate: DateTime(2023)
    );
    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }
}


class TextFieldContainer extends StatelessWidget {
  final Widget? child;
  const TextFieldContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      child: child,
    );
  }
}
