import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutteranimation/CustomEmpty.dart';
import 'package:flutteranimation/CustomStack.dart';
import 'package:flutteranimation/CustomSwiper.dart';
import 'package:flutteranimation/keepAppBar.dart';
import 'dart:io';


void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  final globalKey = GlobalKey<ScaffoldState>();

  void Check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {}
    } on SocketException catch (_) {
      _showDialog(context);
    }
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('İnternet Hatası!'),
              content: Text(
                  'İnternet bağlantınız bulunmuyor! Lütfen daha sonra tekrar deneyin.'),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: new Text("Kapat"))
              ]);
        });
  }

  @override
  void initState() {
    super.initState();
    Check();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changePage(int index) {
    setState(() {
      selectedPage = index;
      print(selectedPage);
    });
  }

  Widget showPage(int selectedPage) {
    print(selectedPage);
    switch (selectedPage) {
      case 0:
        return CustomSwiper();
        break;
      case 1:
        return CustomStack();
        break;
      case 2:
        return CustomEmptyContainer();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: selectedPage == 2 ? true : false,
      key: globalKey,
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final snackbar = SnackBar(
            elevation: 2.0,
            behavior: SnackBarBehavior.fixed,
            backgroundColor: Color(0xff292F33),
            content: Row(
              children: <Widget>[
                SvgPicture.asset('assets/1f426.svg'),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Snackbar is amazing!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
          );
          globalKey.currentState.showSnackBar(snackbar);
        },
        backgroundColor: Color(0xff292F33),
        child: SvgPicture.asset(
          'assets/1f423.svg',
          width: 30,
        ),
      ),
      appBar: KeepBar(
        height: 70.0,
      ),
      body: showPage(selectedPage),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changePage,
        currentIndex: selectedPage,
        fixedColor: Colors.black,
        iconSize: 35,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            title: SizedBox(
              height: 0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: SizedBox(
              height: 0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: SizedBox(
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
