import 'package:calendar_sample/provider/event_provider.dart';
import 'package:calendar_sample/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'page/event_editing_page.dart';
import 'widget/calendar_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'カレンダー帳',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black,
            accentColor: Colors.white,
            primaryColor: Colors.lightGreenAccent),
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("カレンダー帳"),
        centerTitle: true,
      ),
      body: CalendarWidget(),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          '予定を入力',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.lightGreenAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => EventEditingPage()));
        },
      ),
    );
  }
}
