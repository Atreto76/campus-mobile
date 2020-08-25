import 'package:campus_mobile_experimental/core/constants/app_constants.dart';
import 'package:campus_mobile_experimental/core/data_providers/events_data_provider.dart';
import 'package:campus_mobile_experimental/core/models/events_model.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/container_view.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsList extends StatelessWidget {
  const EventsList({Key key, this.listSize}) : super(key: key);

  final int listSize;

  @override
  Widget build(BuildContext context) {
    return Provider.of<EventsDataProvider>(context).isLoading
        ? Center(child: CircularProgressIndicator())
        : buildEventsList(
            Provider.of<EventsDataProvider>(context).eventsModels, context);
  }

  Widget buildEventsList(List<EventModel> listOfEvents, BuildContext context) {
    final List<Widget> eventTiles = List<Widget>();

    /// check to see if we want to display only a limited number of elements
    /// if no constraint is given on the size of the list then all elements
    /// are rendered
    var size;
    if (listSize == null)
      size = listOfEvents.length;
    else
      size = listSize;

    /// check to see if we have at least 3 events
    if (size > listOfEvents.length) {
      size = listOfEvents.length;
    }
    for (int i = 0; i < size; i++) {
      final EventModel item = listOfEvents[i];
      final tile = buildEventTile(item, context);
      eventTiles.add(tile);
    }

    if (listSize != null) {
      return ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children:
            ListTile.divideTiles(tiles: eventTiles, context: context).toList(),
      );
    } else {
      return ContainerView(
        child: listOfEvents.isEmpty
            ? Center(child: Text('No events found.'))
            : ListView(
                children:
                    ListTile.divideTiles(tiles: eventTiles, context: context)
                        .toList(),
              ),
      );
    }
  }

  Widget buildEventTile(EventModel data, BuildContext context) {
    return ListTile(
      isThreeLine: true,
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.EventDetailView,
            arguments: data);
      },
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Text(
          data.title.t,
          textAlign: TextAlign.start,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      subtitle: subtitle(data),
    );
  }

  Widget subtitle(EventModel data) {
    return Container(
      height: 60,
      child: Row(
        children: <Widget>[
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                data.description.t != null
                    ? Text(
                        (data.description.t),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )
                    : Container(),
                SizedBox(height: 5),
                Row(
                  children: <Widget>[
//                    Text(DateFormat.MMMMd().format(data.startdate.text.toLocal()) +
//                        ', '),
                    //Text(data.startdate.text + data.enddate.text)
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 4),
          data.mediaContent != null
              ? ImageLoader(
                  url: data.mediaContent.url,
                  fullSize: true,
                )
              : Container(),
        ],
      ),
    );
  }
}
