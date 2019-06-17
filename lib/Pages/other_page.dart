import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_firebase2/Pages/Create.dart';



class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {

  String id;
  //final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("Request"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Create()));
          var route = new MaterialPageRoute(builder: (BuildContext context) => new Request());
        },
        child: Icon(Icons.add),
        tooltip: "Add a Request",
      ),

    );
  }



}
