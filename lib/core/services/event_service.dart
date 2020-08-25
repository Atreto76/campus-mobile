import 'package:campus_mobile_experimental/core/models/events_model.dart';
import 'package:campus_mobile_experimental/core/services/networking.dart';
import 'package:xml2json/xml2json.dart';

class EventsService {
  // TODO: Fix me
  final String endpoint = 'https://tockify.com/api/feeds/rss/ucenevents';

  bool _isLoading = false;
  DateTime _lastUpdated;
  String _error;
  List<EventModel> _data;

  final NetworkHelper _networkHelper = NetworkHelper();

  EventsService() {
    fetchData();
  }

  Future<bool> fetchData() async {
    _error = null;
    _isLoading = true;
    try {
      /// fetch data
      String _response = await _networkHelper.fetchData(endpoint);

      /// parse data
      final transformer = Xml2Json();
      transformer.parse(_response);
      String _jsonResponse = transformer.toGData();
      final data = eventsRssFromJson(_jsonResponse).rss.channel.item;
      _isLoading = false;
      _data = data;
      return true;
    } catch (e) {
      _error = e.toString();
      print(_error);
      _isLoading = false;
      return false;
    }
  }

  String get error => _error;
  List<EventModel> get eventsModels => _data;
  bool get isLoading => _isLoading;
  DateTime get lastUpdated => _lastUpdated;
}
