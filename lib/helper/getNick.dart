// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:fruithero/pages/settingsPage.dart';
// import 'package:provider/provider.dart';

// class GetNick extends StatefulWidget {
//   @override
//   _GetNickState createState() => _GetNickState();
// }

// class _GetNickState extends State<GetNick> {
//   @override
//   Widget build(BuildContext context) {

//      final nicks = Provider.of<QuerySnapshot>(context);
//      dynamic ola = '';
//      final test1 = Settings(test: ola,);

//      for(var doc in nicks.documents) {
//        print(doc.data.toString());
//        setState(() {
//          ola = doc.data.toString();
//        });
//      }

//     return Text(
//         ola
//     );
//   }
// }