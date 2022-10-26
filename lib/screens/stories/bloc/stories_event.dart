import 'package:meta/meta.dart';

@immutable
abstract class StoriesEvent {}

class StoryAnimationCompleted extends StoriesEvent {}

class onUserTapLeftEvent extends StoriesEvent {}

class UserChanged extends StoriesEvent {}

class onUserTapRightEvent extends StoriesEvent {}

class onCubitAnimationPlay extends StoriesEvent {}

class VideoStoryInitialized extends StoriesEvent {}

class TapLeftToPreviousStory extends StoriesEvent {}
