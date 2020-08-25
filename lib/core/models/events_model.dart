// To parse this JSON data, do
//
//     final eventsRss = eventsRssFromJson(jsonString);

import 'dart:convert';

EventsRss eventsRssFromJson(String str) => EventsRss.fromJson(json.decode(str));

String eventsRssToJson(EventsRss data) => json.encode(data.toJson());

class EventsRss {
  EventsRss({
    this.rss,
  });

  Rss rss;

  factory EventsRss.fromJson(Map<String, dynamic> json) => EventsRss(
        rss: json["rss"] == null ? null : Rss.fromJson(json["rss"]),
      );

  Map<String, dynamic> toJson() => {
        "rss": rss == null ? null : rss.toJson(),
      };
}

class Rss {
  Rss({
    this.version,
    this.xmlns,
    this.xmlnsSy,
    this.xmlnsMedia,
    this.xmlnsAtom,
    this.xmlnsContent,
    this.xmlnsDc,
    this.xmlnsEv,
    this.channel,
  });

  String version;
  List<Xmln> xmlns;
  String xmlnsSy;
  String xmlnsMedia;
  String xmlnsAtom;
  String xmlnsContent;
  String xmlnsDc;
  String xmlnsEv;
  Channel channel;

  factory Rss.fromJson(Map<String, dynamic> json) => Rss(
        version: json["version"] == null ? null : json["version"],
        xmlns: json["xmlns"] == null
            ? null
            : List<Xmln>.from(json["xmlns"].map((x) => Xmln.fromJson(x))),
        xmlnsSy: json["xmlns\u0024sy"] == null ? null : json["xmlns\u0024sy"],
        xmlnsMedia:
            json["xmlns\u0024media"] == null ? null : json["xmlns\u0024media"],
        xmlnsAtom:
            json["xmlns\u0024atom"] == null ? null : json["xmlns\u0024atom"],
        xmlnsContent: json["xmlns\u0024content"] == null
            ? null
            : json["xmlns\u0024content"],
        xmlnsDc: json["xmlns\u0024dc"] == null ? null : json["xmlns\u0024dc"],
        xmlnsEv: json["xmlns\u0024ev"] == null ? null : json["xmlns\u0024ev"],
        channel:
            json["channel"] == null ? null : Channel.fromJson(json["channel"]),
      );

  Map<String, dynamic> toJson() => {
        "version": version == null ? null : version,
        "xmlns": xmlns == null
            ? null
            : List<dynamic>.from(xmlns.map((x) => x.toJson())),
        "xmlns\u0024sy": xmlnsSy == null ? null : xmlnsSy,
        "xmlns\u0024media": xmlnsMedia == null ? null : xmlnsMedia,
        "xmlns\u0024atom": xmlnsAtom == null ? null : xmlnsAtom,
        "xmlns\u0024content": xmlnsContent == null ? null : xmlnsContent,
        "xmlns\u0024dc": xmlnsDc == null ? null : xmlnsDc,
        "xmlns\u0024ev": xmlnsEv == null ? null : xmlnsEv,
        "channel": channel == null ? null : channel.toJson(),
      };
}

class Channel {
  Channel({
    this.title,
    this.atomLink,
    this.link,
    this.description,
    this.language,
    this.lastBuildDate,
    this.syUpdatePeriod,
    this.syUpdateFrequency,
    this.generator,
    this.item,
  });

  Generator title;
  AtomLink atomLink;
  Generator link;
  Xmln description;
  Generator language;
  Generator lastBuildDate;
  Generator syUpdatePeriod;
  Generator syUpdateFrequency;
  Generator generator;
  List<EventModel> item;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
        title: json["title"] == null ? null : Generator.fromJson(json["title"]),
        atomLink: json["atom\u0024link"] == null
            ? null
            : AtomLink.fromJson(json["atom\u0024link"]),
        link: json["link"] == null ? null : Generator.fromJson(json["link"]),
        description: json["description"] == null
            ? null
            : Xmln.fromJson(json["description"]),
        language: json["language"] == null
            ? null
            : Generator.fromJson(json["language"]),
        lastBuildDate: json["lastBuildDate"] == null
            ? null
            : Generator.fromJson(json["lastBuildDate"]),
        syUpdatePeriod: json["sy\u0024updatePeriod"] == null
            ? null
            : Generator.fromJson(json["sy\u0024updatePeriod"]),
        syUpdateFrequency: json["sy\u0024updateFrequency"] == null
            ? null
            : Generator.fromJson(json["sy\u0024updateFrequency"]),
        generator: json["generator"] == null
            ? null
            : Generator.fromJson(json["generator"]),
        item: json["item"] == null
            ? null
            : List<EventModel>.from(
                json["item"].map((x) => EventModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title.toJson(),
        "atom\u0024link": atomLink == null ? null : atomLink.toJson(),
        "link": link == null ? null : link.toJson(),
        "description": description == null ? null : description.toJson(),
        "language": language == null ? null : language.toJson(),
        "lastBuildDate": lastBuildDate == null ? null : lastBuildDate.toJson(),
        "sy\u0024updatePeriod":
            syUpdatePeriod == null ? null : syUpdatePeriod.toJson(),
        "sy\u0024updateFrequency":
            syUpdateFrequency == null ? null : syUpdateFrequency.toJson(),
        "generator": generator == null ? null : generator.toJson(),
        "item": item == null
            ? null
            : List<dynamic>.from(item.map((x) => x.toJson())),
      };
}

class AtomLink {
  AtomLink({
    this.href,
    this.rel,
    this.type,
  });

  String href;
  String rel;
  String type;

  factory AtomLink.fromJson(Map<String, dynamic> json) => AtomLink(
        href: json["href"] == null ? null : json["href"],
        rel: json["rel"] == null ? null : json["rel"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
        "rel": rel == null ? null : rel,
        "type": type == null ? null : type,
      };
}

class Xmln {
  Xmln();

  factory Xmln.fromJson(Map<String, dynamic> json) => Xmln();

  Map<String, dynamic> toJson() => {};
}

class Generator {
  Generator({
    this.t,
  });

  String t;

  factory Generator.fromJson(Map<String, dynamic> json) => Generator(
        t: json["\u0024t"] == null ? null : json["\u0024t"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024t": t == null ? null : t,
      };
}

class EventModel {
  EventModel({
    this.title,
    this.description,
    this.mediaContent,
    this.evStartdate,
    this.evEnddate,
    this.link,
    this.guid,
    this.evLocation,
    this.category,
  });

  Generator title;
  Generator description;
  MediaContent mediaContent;
  Generator evStartdate;
  Generator evEnddate;
  Generator link;
  Guid guid;
  Generator evLocation;
  dynamic category;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        title: json["title"] == null ? null : Generator.fromJson(json["title"]),
        description: json["description"] == null
            ? null
            : Generator.fromJson(json["description"]),
        mediaContent: json["media\u0024content"] == null
            ? null
            : MediaContent.fromJson(json["media\u0024content"]),
        evStartdate: json["ev\u0024startdate"] == null
            ? null
            : Generator.fromJson(json["ev\u0024startdate"]),
        evEnddate: json["ev\u0024enddate"] == null
            ? null
            : Generator.fromJson(json["ev\u0024enddate"]),
        link: json["link"] == null ? null : Generator.fromJson(json["link"]),
        guid: json["guid"] == null ? null : Guid.fromJson(json["guid"]),
        evLocation: json["ev\u0024location"] == null
            ? null
            : Generator.fromJson(json["ev\u0024location"]),
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title.toJson(),
        "description": description == null ? null : description.toJson(),
        "media\u0024content":
            mediaContent == null ? null : mediaContent.toJson(),
        "ev\u0024startdate": evStartdate == null ? null : evStartdate.toJson(),
        "ev\u0024enddate": evEnddate == null ? null : evEnddate.toJson(),
        "link": link == null ? null : link.toJson(),
        "guid": guid == null ? null : guid.toJson(),
        "ev\u0024location": evLocation == null ? null : evLocation.toJson(),
        "category": category,
      };
}

class Guid {
  Guid({
    this.isPermaLink,
    this.t,
  });

  String isPermaLink;
  String t;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        isPermaLink: json["isPermaLink"] == null ? null : json["isPermaLink"],
        t: json["\u0024t"] == null ? null : json["\u0024t"],
      );

  Map<String, dynamic> toJson() => {
        "isPermaLink": isPermaLink == null ? null : isPermaLink,
        "\u0024t": t == null ? null : t,
      };
}

class MediaContent {
  MediaContent({
    this.url,
    this.medium,
    this.type,
    this.width,
    this.height,
  });

  String url;
  Medium medium;
  Type type;
  String width;
  String height;

  factory MediaContent.fromJson(Map<String, dynamic> json) => MediaContent(
        url: json["url"] == null ? null : json["url"],
        medium:
            json["medium"] == null ? null : mediumValues.map[json["medium"]],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "medium": medium == null ? null : mediumValues.reverse[medium],
        "type": type == null ? null : typeValues.reverse[type],
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}

enum Medium { IMAGE }

final mediumValues = EnumValues({"image": Medium.IMAGE});

enum Type { IMAGE_JPEG, IMAGE_PNG }

final typeValues =
    EnumValues({"image/jpeg": Type.IMAGE_JPEG, "image/png": Type.IMAGE_PNG});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
