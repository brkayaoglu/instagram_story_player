import 'user_model.dart';

enum MediaType {
  image,
  video,
}

class StoryUiModel {
  final String url;
  final MediaType media;
  final Duration? duration;
  bool isWatched = false;

  StoryUiModel(
      {required this.url, required this.media, required this.duration});
}
