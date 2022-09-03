import 'package:flutter/material.dart';

class calcButton extends StatelessWidget {

String btntxt;
Color btncolor;
Color txtcolor;
final Function pressed;

calcButton(this.btntxt,this.btncolor,this.txtcolor,this.pressed);

  @override
  Widget build(BuildContext context) {
    return  Container(
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () => pressed(),
        child: Text('$btntxt',
          style: TextStyle(
            fontSize: 35,
            color: txtcolor,
          ),
        ),
        shape: RoundedRectangleBorder(),
        color: btncolor,
        padding: EdgeInsets.all(20),
      ),
    );
  }
}