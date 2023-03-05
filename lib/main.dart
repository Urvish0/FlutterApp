import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_app/firebase_options.dart';
// import 'package:flutter/src/scheduler/ticker.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:practice_app/splash_screen.dart';
import './Screens/userinfo_screen.dart';
import './Screens/dash.dart';
import './Screens/prof.dart';
import './Screens/search.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', // id
//     'Water Reminder', // title
//     description:
//     'GO get a glass of water', // description
//     importance: Importance.high,
//     playSound: true);
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('A bg message just showed up :  ${message.messageId}');
// }
// int BMR = 0;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //
  // await flutterLocalNotificationsPlugin.
  // resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);
  //
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 15),
        )
      ),
      home: SplashScreen(),
    );
  }
}

class Mainpage extends StatefulWidget{
  @override
  _mainPage createState() => _mainPage();

}
class _mainPage extends State<Mainpage> with SingleTickerProviderStateMixin{
  late TabController tabcontroller=new TabController(length: 3, vsync: this);
  @override

  // void initState(){
  //   super.initState();
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message){
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null){
  //       flutterLocalNotificationsPlugin.show(
  //           notification.hashCode,
  //         notification.title,
  //         notification.body,
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             channel.id,
  //             channel.name,
  //             channelDescription: channel.description,
  //             color: Colors.blue,
  //             playSound: true,
  //           ),
  //         )
  //       );
  //     }
  //   });
  //
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
  //     print('A new onMessageOpenedApp event was published!');
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if(notification != null && android != null){
  //       showDialog(
  //           context: context,
  //           builder: (_){
  //             return AlertDialog(
  //               title: Text(notification.title!),
  //               content: SingleChildScrollView(
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [Text(notification.body!)],
  //                 ),
  //               ),
  //             );
  //           });
  //     }
  //   });
  // }

  // void sendNotification(){
  //   setState(() {
  //
  //   });
  //   flutterLocalNotificationsPlugin.show(
  //       0,
  //       "Testing ",
  //       "How you doin ?",
  //       NotificationDetails(
  //           android: AndroidNotificationDetails(
  //               channel.id,
  //               channel.name,
  //               channelDescription: channel.description,
  //               importance: Importance.high,
  //               color: Colors.blue,
  //               playSound: true,
  //               )));
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: TabBarView(
        controller: tabcontroller,
        children: [
          Dashboard(),
          HomePageWidget(),
          profile(),
        ],
      ),
      bottomNavigationBar: TabBar(
        // overlayColor: Colors.blueAccent,
        controller: tabcontroller,
        labelColor: Colors.black,
        tabs: [
          Tab(
              icon: Icon(Icons.home),
          ),
          Tab(
              icon: Icon(Icons.fastfood_outlined)
          ),
          // Tab(
          //     icon: Icon(Icons.water_drop_outlined)
          // ),
          Tab(
              icon: Icon(Icons.account_box),
          ),
        ],
      ),
    );
  }

}



