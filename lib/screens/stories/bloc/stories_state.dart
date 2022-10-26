abstract class StoriesState {}

class StoriesInitial extends StoriesState {}

class StoriesLoading extends StoriesState {}

class StoryFinished extends StoriesState {}

class StoryLoaded extends StoriesState {}

class PreviousStoryLoaded extends StoriesState {}

class StoryPause extends StoriesState {}

class UserStoryLoaded extends StoriesState {}
