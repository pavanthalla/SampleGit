import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  String cname;
  int pnd;
  int cds;
  String iname;
  Cards(String cname, int p, int c, String iname) {
    this.cname = cname;
    this.pnd = p;
    this.cds = c;
    this.iname = iname;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 180.0,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.orangeAccent,
            offset: Offset(2, 20),
            blurRadius: 10,
          )
        ]),
        width: 120.0,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 90.0,
              width: 120.0,
              child: Image(image: AssetImage('images/$iname.png')),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              cname,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 5.0,
                ),
                Icon(Icons.favorite),
                SizedBox(
                  width: 3.0,
                ),
                Text('$pnd'),
                SizedBox(
                  width: 15.0,
                ),
                Icon(Icons.monetization_on),
                SizedBox(
                  width: 5.0,
                ),
                Text('$cds')
              ],
            )
          ],
        ),
      ),
    );
  }
}
