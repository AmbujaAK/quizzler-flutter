import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';


showAlert(context){
  return Alert(
    context: context,
    type: AlertType.success,
    title: "Please Restart",
    desc: "Quiz is over, click on restart.",
    buttons: [
      DialogButton(
        child: Text(
          "Restart",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: (){
          Navigator.pop(context);
        },
        width: 120,
      )
    ],
  ).show();
}