import 'package:cloud_firestore/cloud_firestore.dart';


class DataBaseServices{

final uid;
DataBaseServices({this.uid});

//To create a reference to the firebase
final CollectionReference userNickname  = Firestore.instance.collection('NickNames of Users');

//Now making a function that creates a new document automatically for each user and puts in there nickname..

Future createDocumentWithUid(dynamic nickname) async{
         return await userNickname.document(uid).setData({
               'MyNickName' : nickname,
         });
   }
 }

