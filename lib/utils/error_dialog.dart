import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Models/error_model.dart';

void errorDialog(BuildContext context , CustomError e){

  if(Platform.isIOS){
    showCupertinoDialog(
    context: context, 
    builder: (context){
      return CupertinoAlertDialog(
        title: Text(e.code),
        content: Text(e.plugin + '\n' + e.message),
        actions: [
          CupertinoDialogAction(
            child: 
            Text('Ok'),
            onPressed: (){
              Navigator.pop(context);
            },
            )
        ],
      );
    }
    
    );
  }else{
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text(e.code),
          content: Text(e.plugin + '\n' + e.message),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: Text('OK'))
          ],
        );
      });
  }
}