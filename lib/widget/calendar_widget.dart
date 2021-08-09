import 'package:calendar_sample/model/event_source.dart';
import 'package:calendar_sample/provider/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'tasks_widget.dart';

class CalendarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return SfCalendar(
      // many types
      view: CalendarView.month,
      // schedule  day  timelineMonth  timelineWorkWeek  timelineWeek  timelineDay

      
      initialSelectedDate: DateTime.now(),
      cellBorderColor: Colors.transparent,
      
      dataSource: EventDataSource(events),
      onTap: (details) {
        final provider = Provider.of<EventProvider>(context, listen: false);

        provider.setDate(details.date!);
        showModalBottomSheet(
          context: context,
          builder: (context) => TasksWidget(),
        );
      },
    );
  }
}
