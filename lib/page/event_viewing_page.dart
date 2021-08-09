import 'package:calendar_sample/model/event.dart';
import 'package:calendar_sample/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'event_editing_page.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;

  const EventViewingPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        verticalDirection: VerticalDirection.up, // childrenの先頭が下に配置されます。
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 1つ目のFAB
          FloatingActionButton(
              heroTag: "削除",
              child: Icon(Icons.delete),
              backgroundColor: Colors.pink[200],
              onPressed: () {
                final provider =
                    Provider.of<EventProvider>(context, listen: false);

                provider.deleteEvent(event);
                Navigator.of(context).pop();
              }),
          // 2つ目のFAB
          Container(
            margin: EdgeInsets.only(bottom: 16.0),
            child: FloatingActionButton(
                heroTag: "編集",
                child: Icon(Icons.edit),
                backgroundColor: Colors.blue[200],
                onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (ctx) => EventEditingPage(event: event)))),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('予定の詳細'),
        centerTitle: true,
        leading: CloseButton(),
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: [
          SizedBox(
            height: 32,
          ),
          Text(
            event.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // const SizedBox(
          //   height: 24,
          // ),
          // Text(
          //   event.description,
          //   style: TextStyle(color: Colors.white, fontSize: 18),
          // )
        ],
      ),
    );
  }
}
