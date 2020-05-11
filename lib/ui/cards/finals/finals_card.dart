import 'package:campus_mobile_experimental/core/data_providers/class_schedule_data_provider.dart';
import 'package:campus_mobile_experimental/core/data_providers/user_data_provider.dart';
import 'package:campus_mobile_experimental/core/models/class_schedule_model.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/time_range_widget.dart';

import 'package:campus_mobile_experimental/ui/reusable_widgets/card_container.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/last_updated_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinalsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardContainer(
      active: Provider.of<UserDataProvider>(context).cardStates['finals'] &&
          Provider.of<UserDataProvider>(context).isLoggedIn,
      hide: () => Provider.of<UserDataProvider>(context, listen: false)
          .toggleCard('finals'),
      reload: () {
        Provider.of<ClassScheduleDataProvider>(context, listen: false)
            .fetchData();
      },
      isLoading: Provider.of<ClassScheduleDataProvider>(context).isLoading,
      title: Text("Finals"),
      errorText: Provider.of<ClassScheduleDataProvider>(context).error,
      child: () => buildFinalsCard(
          Provider.of<ClassScheduleDataProvider>(context).finals,
          Provider.of<ClassScheduleDataProvider>(context).lastUpdated,
          Provider.of<ClassScheduleDataProvider>(context).nextDayWithClass,
          context),
    );
  }

  String abbrevToFullWeekday(String abbreviation) {
    switch (abbreviation) {
      case 'MO':
        return 'Monday';
      case 'TU':
        return 'Tuesday';
      case 'WE':
        return 'Wednesday';
      case 'TH':
        return 'Thrusday';
      case 'FR':
        return 'Friday';
      case 'SA':
        return 'Saturday';
      case 'SU':
        return 'Sunday';
      case 'Other':
        return 'Other';
      default:
        return 'Other';
    }
  }

  Widget buildFinalsCard(Map<String, List<SectionData>> finalsData,
      DateTime lastUpdated, String nextDayWithClasses, BuildContext context) {
    List<Widget> listToReturn = List<Widget>();
    finalsData.forEach((key, value) {
      for (SectionData data in value) {
        listToReturn.add(ListTile(
          title: buildWeekdayText(abbrevToFullWeekday(data.days)),
          subtitle: Column(
            children: [
              buildClassTitle(data.subjectCode + ' ' + data.courseCode),
              buildTimeRow(data.time),
              buildClassTitle(data.courseTitle),
              buildLocationRow(data.building + ' ' + data.room),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ));
      }
    });
    listToReturn =
        ListTile.divideTiles(tiles: listToReturn, context: context).toList();
    listToReturn.add(
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
        child: LastUpdatedWidget(time: lastUpdated),
      ),
    );
    return ListView(children: listToReturn);
  }

  Widget buildClassTitle(String title) {
    return Text(title);
  }

  Widget buildWeekdayText(String nextDayWithClasses) {
    return Text(
      nextDayWithClasses,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  Widget buildClassCode(String className) {
    return Text(
      className,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget buildTimeRow(String time) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TimeRangeWidget(
              time: time,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildLocationRow(String location) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(location),
          ],
        ),
      ],
    );
  }
}
