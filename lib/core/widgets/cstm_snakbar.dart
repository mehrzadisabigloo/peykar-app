import 'package:flutter/material.dart';

class CstmSnackBar{


  SnackBar snackBar(String title,Color color){
    return SnackBar(
      content: Text(title,style: const TextStyle(fontFamily: 'BonyadeKoodak',color: Colors.white),textDirection: TextDirection.rtl,),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
      ),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),

    );
  }

}
