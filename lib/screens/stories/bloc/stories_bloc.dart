import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagramstoryplayer/screens/stories/bloc/stories_event.dart';
import 'package:instagramstoryplayer/screens/stories/bloc/stories_state.dart';

class StoriesBloc extends Bloc<StoriesEvent, StoriesState> {
  StoriesBloc() : super(StoriesInitial()) {
    on<TapLeftToPreviousStory>((event, emit) {
      emit(StoriesLoading());
    });
    on<StoryAnimationCompleted>(
      (event, emit) {
        emit(StoryFinished());
      },
    );
    on<VideoStoryInitialized>(
      (event, emit) {
        emit(StoryLoaded());
      },
    );
    on<onUserTapLeftEvent>(
      (event, emit) {
        emit(PreviousStoryLoaded());
      },
    );
    on<onUserTapRightEvent>(
      (event, emit) {
        emit(StoryFinished());
      },
    );
    on<onCubitAnimationPlay>(
      (event, emit) {
        emit(StoryPause());
      },
    );
    on<UserChanged>(
      (event, emit) {
        emit(UserStoryLoaded());
      },
    );
  }
}
