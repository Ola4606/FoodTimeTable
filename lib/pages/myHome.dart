import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//import 'package:fruithero/services/auth.dart';
import 'package:intl/intl.dart';
import 'package:fruithero/model/date.dart';
import 'package:fruithero/Animation/delayed_animation_reflectly.dart';
//import 'package:firebase_admob/firebase_admob.dart';
// import 'package:fruithero/services/database.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


class Home extends StatefulWidget {

  final dynamic userUid, nicked;
  Home({this.userUid, this.nicked});

  
  
  @override
 _HomeState createState() => _HomeState();
}

// Getting the present day
DateTime _currentdate = new DateTime.now();

// Adding extra days to the day
var oneDayFromNow = _currentdate.add(new Duration(days: 1));
var twoDayFromNow = _currentdate.add(new Duration(days: 2));
var threeDayFromNow = _currentdate.add(new Duration(days: 3));
var fourDayFromNow = _currentdate.add(new Duration(days: 4));
var fiveDayFromNow = _currentdate.add(new Duration(days: 5));
var sixDayFromNow = _currentdate.add(new Duration(days: 6));
var sevenDayFromNow = _currentdate.add(new Duration(days: 7));
var eightDayFromNow = _currentdate.add(new Duration(days: 8));
var nineDayFromNow = _currentdate.add(new Duration(days: 9));
var tenDayFromNow = _currentdate.add(new Duration(days: 10));
var elevenDayFromNow = _currentdate.add(new Duration(days: 11));
var tweleveDayFromNow = _currentdate.add(new Duration(days: 12));
var thirteenDayFromNow = _currentdate.add(new Duration(days: 13));



//Converting to date times to a readable format
var formattedDay = new DateFormat.yMMMd().format(_currentdate);
var formattedDay1 = new DateFormat.yMMMd().format(oneDayFromNow);
var formattedDay2 = new DateFormat.yMMMd().format(twoDayFromNow);
var formattedDay3 = new DateFormat.yMMMd().format(threeDayFromNow);
var formattedDay4 = new DateFormat.yMMMd().format(fourDayFromNow);
var formattedDay5 = new DateFormat.yMMMd().format(fiveDayFromNow);
var formattedDay6 = new DateFormat.yMMMd().format(sixDayFromNow);
var formattedDay7 = new DateFormat.yMMMd().format(sevenDayFromNow);
var formattedDay8 = new DateFormat.yMMMd().format(eightDayFromNow);
var formattedDay9 = new DateFormat.yMMMd().format(nineDayFromNow);
var formattedDay10 = new DateFormat.yMMMd().format(tenDayFromNow);
var formattedDay11 = new DateFormat.yMMMd().format(elevenDayFromNow);
var formattedDay12 = new DateFormat.yMMMd().format(tweleveDayFromNow);
var formattedDay13 = new DateFormat.yMMMd().format(thirteenDayFromNow);


//Getting the day of the week of each day
var formattedDayN = new DateFormat('EEE', 'en_US').format(_currentdate);
var formattedDayN1 = new DateFormat('EEE', 'en_US').format(oneDayFromNow);
var formattedDayN2 = new DateFormat('EEE', 'en_US').format(twoDayFromNow);
var formattedDayN3 = new DateFormat('EEE', 'en_US').format(threeDayFromNow);
var formattedDayN4 = new DateFormat('EEE', 'en_US').format(fourDayFromNow);
var formattedDayN5 = new DateFormat('EEE', 'en_US').format(fiveDayFromNow);
var formattedDayN6 = new DateFormat('EEE', 'en_US').format(sixDayFromNow);
var formattedDayN7 = new DateFormat('EEE', 'en_US').format(sevenDayFromNow);
var formattedDayN8 = new DateFormat('EEE', 'en_US').format(eightDayFromNow);
var formattedDayN9 = new DateFormat('EEE', 'en_US').format(nineDayFromNow);
var formattedDayN10 = new DateFormat('EEE', 'en_US').format(tenDayFromNow);
var formattedDayN11 = new DateFormat('EEE', 'en_US').format(elevenDayFromNow);
var formattedDayN12 = new DateFormat('EEE', 'en_US').format(tweleveDayFromNow);
var formattedDayN13 = new DateFormat('EEE', 'en_US').format(thirteenDayFromNow);


//Placing the newly formatted dates into the list for the List Tile
//Am also placing different colors on each list item
//Am also add a delay for the delayed Animation so it looks fresher
List<DateArrange> dates = [
  DateArrange(dateName: '$formattedDay', dayName: '$formattedDayN', color: Colors.red, image: 'assets/images/egg.png', delay: 3000),
  DateArrange(dateName: '$formattedDay1', dayName: '$formattedDayN1', color: Colors.blue, image: 'assets/images/fish.png', delay: 3500),
  DateArrange(dateName: '$formattedDay2', dayName: '$formattedDayN2', color: Colors.purple, image: 'assets/images/meat.png', delay: 4000),
  DateArrange(dateName: '$formattedDay3', dayName: '$formattedDayN3', color: Colors.orange, image: 'assets/images/vegi.png', delay: 4500),
  DateArrange(dateName: '$formattedDay4', dayName: '$formattedDayN4', color: Colors.green, image: 'assets/images/fish.png', delay: 5000),
  DateArrange(dateName: '$formattedDay5', dayName: '$formattedDayN5', color: Colors.pink, image: 'assets/images/egg.png', delay: 5500),
  DateArrange(dateName: '$formattedDay6', dayName: '$formattedDayN6', color: Colors.yellow, image: 'assets/images/meat.png', delay: 6000),
  DateArrange(dateName: '$formattedDay7', dayName: '$formattedDayN7', color: Colors.brown, image: 'assets/images/fish.png', delay: 6500),
  DateArrange(dateName: '$formattedDay8', dayName: '$formattedDayN8', color: Colors.grey, image: 'assets/images/fruit.png', delay: 7000),
  DateArrange(dateName: '$formattedDay9', dayName: '$formattedDayN9', color: Colors.lime, image: 'assets/images/egg.png', delay: 7500),
  DateArrange(dateName: '$formattedDay10', dayName: '$formattedDayN10', color: Colors.teal, image: 'assets/images/fish.png', delay: 8000),
  DateArrange(dateName: '$formattedDay11', dayName: '$formattedDayN11', color: Colors.blue, image: 'assets/images/vegi.png', delay: 8500),
  DateArrange(dateName: '$formattedDay12', dayName: '$formattedDayN12', color: Colors.red, image: 'assets/images/meat.png', delay: 9000),
  DateArrange(dateName: '$formattedDay13', dayName: '$formattedDayN13', color: Colors.orange, image: 'assets/images/egg.png', delay: 9500),
  
];


class _HomeState extends State<Home> {

 

  final int delayedAmount = 500;
  //final AuthService _auth = AuthService();

  

  String nick,userID;

 void initState() {
super.initState();
userID = widget.userUid;
getNick();
print(userID);
}

 void getNick() {
  var users;
  //get nickname of this User
 Firestore.instance.collection('NickNames of Users').document(userID).get().then((data){
    setState(() {
      users = data;
      nick = users['MyNickName'];
      print(nick); 
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Scaffold(
            backgroundColor: Colors.greenAccent[400],
            // appBar: AppBar(
            //   title: Text(
            //     'Welcome OlaOluwa:',
            //     style: TextStyle(
            //       fontFamily: 'Comic',
            //       color: Colors.white
            //     ),
            //     ),
            //   backgroundColor: Colors.greenAccent[400],
            //   elevation: 0.0,
              // Use this later in the settings page for logging out..
              // actions: <Widget>[
              //   FlatButton.icon(
              //     icon: Icon(Icons.person),
              //     label: Text('logout'),
              //     onPressed: () async {
              //       await _auth.signOut();
              //     },
              //   ),
              // ],
            //),
      body:  SingleChildScrollView(
        physics: ScrollPhysics(),
          child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB( 0 , 50, 0, 0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                                  child: DelayedAnimation(
                   child:  
                    Text(
                             nick,
                    //This i where the firebase nickName code will go
                     textScaleFactor : 1,
                    style: TextStyle(
                      fontFamily: 'Comic',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,

                    ),
                    ),
              
             
                    delay: delayedAmount + 1000,
                              ),
              ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                    child: DelayedAnimation(
                                          child: Text(
                      'TimeTable for the next two(2) weeks:',
                       textScaleFactor : 1,
                      style: TextStyle(
          fontFamily: 'Comic',
          color: Colors.white,
          fontSize: 25
                      ),
                      ),
                      delay: delayedAmount + 2000,
                    ),
                  ),
            ],
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
             itemCount: dates.length,
               itemBuilder: (context, index){
         return DelayedAnimation(
                    child: Container(
             margin: EdgeInsets.fromLTRB( 15, 0, 15, 10),
             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
             height: 110,
             width: 160,
             decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(17.0),
            color: Colors.white,
        ),
             child: ListTile(
               onTap: () {
                   //Shoe BreakFast, Lucnch $ Dinner for that day
                 },
                 title: Padding(
                   padding: const EdgeInsets.only(top: 8.0),
                   child: Text(
                     '${dates[index].dateName}',
                      textScaleFactor : 1,
                     style: TextStyle(
                       color: Colors.greenAccent[400],
                       fontFamily: 'Comic',
                       fontSize: 25
                     ),
                     ),
                 ),
                 subtitle: Text(
                   'BreakFast, Lunch, Dinner',
                    textScaleFactor : 1,
                   style: TextStyle(
                     color: Colors.black87,
                     fontFamily: 'Comic',
                     fontSize: 14
                   ),
                   ),
                   leading: Padding(
                     padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                     child: CircleAvatar(
                     backgroundImage: AssetImage(dates[index].image),
                     radius: 20,
                   ),
                   ),
                   trailing: Padding(
                     padding: const EdgeInsets.fromLTRB(0, 14, 0, 9),
                     child: CircleAvatar(
                         child :  Text(
                       '${dates[index].dayName}',
                        textScaleFactor : 1,
                       style: TextStyle(
                       color: Colors.black,
                       fontFamily: 'Comic',
                       fontWeight: FontWeight.bold,
                       fontSize: 15
                     ),
                     ),
                     radius: 30,
                     backgroundColor: dates[index].color,
                     ),
                   ),
                   
                  ),
           ),
           delay: delayedAmount + dates[index].delay,
         );
         }
             ),
      ],
    ),
  ),
      ),
    );
  }
}

