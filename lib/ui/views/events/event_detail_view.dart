import 'package:campus_mobile_experimental/core/models/events_model.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/container_view.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/image_loader.dart';
import 'package:campus_mobile_experimental/ui/reusable_widgets/linkify_with_catch.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailView extends StatelessWidget {
  const EventDetailView({Key key, @required this.data}) : super(key: key);
  final EventModel data;
  @override
  Widget build(BuildContext context) {
    return ContainerView(
      child: ListView(
        children: buildDetailView(context),
      ),
    );
  }

  List<Widget> buildDetailView(BuildContext context) {
    return [
      Center(
        child: ImageLoader(
          url: data.mediaContent.url,
          fullSize: true,
        ),
      ),
      Divider(),
      Text(
        data.title.t,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.title,
      ),
      Divider(),
      LinkifyWithCatch(
        text: data.link.t,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
      Center(child: Text(data.evStartdate.t + data.evEnddate.t)),
      Divider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: LinkifyWithCatch(
          text: data.description.t,
          style: TextStyle(fontSize: 16),
        ),
      ),
      data.mediaContent.url != null && data.mediaContent.url.isNotEmpty
          ? LearnMoreButton(link: data.mediaContent.url)
          : Container(),
    ];
  }
}

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({Key key, @required this.link}) : super(key: key);
  final String link;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: FlatButton(
          child: Text(
            'Learn More',
            style: TextStyle(
                fontSize: 16, color: Theme.of(context).textTheme.button.color),
          ),
          color: Theme.of(context).buttonColor,
          onPressed: () async {
            try {
              if (await canLaunch(link)) {
                await launch(link);
              } else {
                throw 'Could not launch $link';
              }
            } catch (e) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Could not open.'),
              ));
            }
          }),
    );
  }
}
