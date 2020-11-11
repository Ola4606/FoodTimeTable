import 'package:flutter/material.dart';
import 'package:fruithero/authenticate/authenticate.dart';
import 'package:fruithero/model/user.dart';
//import 'package:fruithero/pages/myHome.dart';
import 'package:fruithero/shared/curvedBar.dart';
import 'package:provider/provider.dart';



class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return BottomNavbar();
    }
    
  }
}