import '../model/story_model.dart';
import '../model/user_model.dart';

const imageDisplayDuration = 5;

final List<UserStoryUiModel> users = [
  UserStoryUiModel(
      name: 'John Doe1asdasdasdasdasda',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
      stories: stories2),
  UserStoryUiModel(
      name: 'John Doe2',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
      stories: stories),
  UserStoryUiModel(
      name: 'John Doe3',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
      stories: stories2),
  UserStoryUiModel(
      name: 'John Doe4',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
      stories: stories),
  UserStoryUiModel(
      name: 'John Doe5',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
      stories: stories2),
  UserStoryUiModel(
      name: 'John Doe1',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
      stories: stories2),
  UserStoryUiModel(
      name: 'John Doe2',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
      stories: stories),
  UserStoryUiModel(
      name: 'John Doe3',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
      stories: stories),
  UserStoryUiModel(
      name: 'John Doe4',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
      stories: stories),
  UserStoryUiModel(
      name: 'John Doe5',
      profileImageUrl: 'https://wallpapercave.com/wp/AYWg3iu.jpg',
      stories: stories)
];

final List<StoryUiModel> stories = [
  StoryUiModel(
      url:
          'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      media: MediaType.image,
      duration: const Duration(seconds: imageDisplayDuration)),
  StoryUiModel(
      url:
          'https://static.videezy.com/system/resources/previews/000/005/529/original/Reaviling_Sjusj%C3%B8en_Ski_Senter.mp4',
      media: MediaType.video,
      duration: null),
  StoryUiModel(
      url:
          'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
      media: MediaType.image,
      duration: const Duration(seconds: imageDisplayDuration)),
  StoryUiModel(
      url:
          'https://static.videezy.com/system/resources/previews/000/007/536/original/rockybeach.mp4',
      media: MediaType.video,
      duration: null)
];

final List<StoryUiModel> stories2 = [
  StoryUiModel(
      url:
          'https://images.unsplash.com/photo-1531694611353-d4758f86fa6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80',
      media: MediaType.image,
      duration: const Duration(seconds: imageDisplayDuration)),
  StoryUiModel(
      url:
          'https://images.unsplash.com/photo-1534103362078-d07e750bd0c4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      media: MediaType.image,
      duration: const Duration(seconds: imageDisplayDuration)),
  StoryUiModel(
      url:
          'https://static.videezy.com/system/resources/previews/000/005/529/original/Reaviling_Sjusj%C3%B8en_Ski_Senter.mp4',
      media: MediaType.video,
      duration: null),
  StoryUiModel(
      url:
          'https://static.videezy.com/system/resources/previews/000/007/536/original/rockybeach.mp4',
      media: MediaType.video,
      duration: null)
];
