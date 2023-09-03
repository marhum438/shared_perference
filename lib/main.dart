import 'package:flutter/material.dart';
import 'package:flutter_application_1/call.dart';
import 'package:flutter_application_1/counter.dart';

import 'package:flutter_application_1/homePage.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/intropage.dart';

import 'package:flutter_application_1/splashscreen.dart';
import 'package:flutter_application_1/status.dart';
import 'package:flutter_application_1/whatsapp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // home:Counter(),
      // home:HomePage(),
      // home:Intropage(),
      // home:splashscreen(),
      // home:whatsapp(),
      // home:status(),
      // home:callapp(),
      // home:FavoriteScreen(),
           home: HomeScreen(),
          // home:Splashscreen (),
          // home:loginscreen(),
          // home:home(),
    );
  }
}

// IconButton(
//   onPressed: () async {
//     var index = checkfavIndex(dataList[i]["name"].toString());
//     if (index != -1) {
//       itemdata.removeAt(index); // Remove the item
//     } else {
//       itemdata.add(dataList[i]); // Add the item
//     }
//     await Preferences.saveitem(itemdata);
//     setState(() {});
//   },
//   icon: Icon(
//     Icons.favorite,
//     color: checkfavIndex(dataList[i]["name"].toString()) != -1
//         ? Colors.red
//         : Colors.grey,
//   ),
// )

// int checkfavIndex(String name) {
//   if (itemdata != null) {
//     for (var i = 0; i < itemdata.length; i++) {
//       if (itemdata[i]["name"] == name) {
//         return i;
//       }
//     }
//   }
//   return -1;
// }