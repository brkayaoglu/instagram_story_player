import 'package:instagramstoryplayer/model/story_model.dart';

class UserStoryUiModel {
  final String name;
  final String profileImageUrl;
  final List<StoryUiModel> stories;
  int indexWhereUserLeft = 0;

  bool isAllStoriesWatched() {
    return stories.where((story) => story.isWatched == false).toList().isEmpty;
  }

  UserStoryUiModel(
      {required this.name,
      required this.profileImageUrl,
      required this.stories});
}
