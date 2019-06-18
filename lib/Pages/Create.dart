import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';


class Request {
  String _id;
  String _venue;
  String _amount;

  Request(this._id, this._venue, this._amount);

  String get id => _id;
  String get title => _venue;
  String get amount => _amount;

  }

final db = Firestore.instance;
CollectionReference collectionReference = db.collection('requests');

Map createRequest(String _amount, String _venue){


  var dataMap = new Map<String, dynamic>();
  dataMap['venue'] = _venue;
  dataMap['amount'] = _amount;

  collectionReference.document().setData(dataMap);
  return dataMap;
}

final _formKey = GlobalKey<FormState>();
String name;
final textController1 = TextEditingController();
int counter = 0;



class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();

}

class _CreateState extends State<Create> {
  void onPressed() {
    setState(() {
      counter++;
      return createRequest('3000', 'Room 304');
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text("Create"),),
        body: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[

            RaisedButton( onPressed: onPressed, child: Text("Create", style: TextStyle(color: Colors.redAccent),), color: Colors.green, ),

                LayoutBuilder(
                  builder: (context, size) {
                    TextSpan text = new TextSpan(
                      text: "Hi",
                      style: new TextStyle(fontSize: 20.0),
                    );
                    TextPainter tp = new TextPainter(
                      text: text,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                    );
                    tp.layout(maxWidth: size.maxWidth);

                    int lines = (tp.size.height / tp.preferredLineHeight).ceil();
                    int maxLines = 10;


                    return new Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: TextField(
                        controller: textController1,
                        maxLines: lines < maxLines ? null : maxLines,
                        style: new TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }
                )
              ],
            )



            
        

    );
  }
}
