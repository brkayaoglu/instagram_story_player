import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagramstoryplayer/screens/stories/bloc/stories_bloc.dart';
import 'package:instagramstoryplayer/screens/stories/bloc/stories_event.dart';
import 'package:instagramstoryplayer/screens/stories/bloc/stories_state.dart';
import 'package:video_player/video_player.dart';
import '../../core/locale_manager.dart';
import '../../model/story_model.dart';
import '../../model/user_model.dart';
import '../../ui/animated_bar.dart';
import '../../utils/screen_utils.dart';

class StoriesScreen extends StatefulWidget {
  final UserStoryUiModel user;
  final int storyIndex;

  const StoriesScreen(
      {super.key, required this.user, required this.storyIndex});

  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen>
    with SingleTickerProviderStateMixin {
  VideoPlayerController? _videoController;
  PageController? _pageController;
  AnimationController? _animController;
  StoryUiModel? currentStory;
  UserStoryUiModel? currentUser;
  var currentPageValue = 0.0;
  int _currentStoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this);
    _currentStoryIndex = widget.storyIndex;
    currentUser = widget.user;
    currentStory = currentUser?.stories[_currentStoryIndex];
    _loadStory(currentStory, context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoriesBloc, StoriesState>(builder: (context, state) {
      if (state is StoryFinished) {
        _currentStoryIndex += 1;
        if (_currentStoryIndex == currentUser?.stories.length) {
          _currentStoryIndex = 0;
        }
        LocaleManager.instance.setIntValue(currentUser?.name ?? "", 0);
        currentStory = currentUser?.stories[_currentStoryIndex];
        _loadStory(currentStory, context);
      } else if (state is PreviousStoryLoaded) {
        _currentStoryIndex -= 1;
        if (_currentStoryIndex < 0) {
          _currentStoryIndex = 0;
        }
        currentStory = currentUser?.stories[_currentStoryIndex];
        _loadStory(currentStory, context);
      } else if (state is StoryPause) {
        return Text("data");
      }
      _animController?.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animController?.stop();
          _animController?.reset();
          context.read<StoriesBloc>().add(StoryAnimationCompleted());
        }
      });

      return GestureDetector(
        onTapUp: (details) => _onTapUp(details, context),
        onLongPress: () => _onLongPressDown(),
        onLongPressEnd: (details) => _onLongPressEnd(details),
        child: Stack(
          children: [
            _mainStoryView(),
            _animationBar(),
          ],
        ),
      );
    });
  }

  Positioned _animationBar() {
    return Positioned(
      top: 40.0,
      left: 10.0,
      right: 10.0,
      child: Column(
        children: <Widget>[
          Row(
            children: widget.user.stories
                .asMap()
                .map((i, e) {
                  return MapEntry(
                    i,
                    AnimatedBar(
                      animController: _animController!,
                      position: i,
                      currentIndex: _currentStoryIndex,
                    ),
                  );
                })
                .values
                .toList(),
          )
        ],
      ),
    );
  }

  PageView _mainStoryView() {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: currentUser?.stories.length,
      itemBuilder: (context, index) {
        switch (currentStory?.media) {
          case MediaType.image:
            return CachedNetworkImage(
              imageUrl: currentStory?.url ?? "",
              fit: BoxFit.cover,
            );
          case MediaType.video:
            return FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                    width: _videoController?.value.size.width,
                    height: _videoController?.value.size.height,
                    child: VideoPlayer(_videoController!)));
          case null:
            return Text("error");
        }
      },
    );
  }

  @override
  void dispose() {
    _animController?.dispose();
    _videoController?.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  void _loadStory(StoryUiModel? currentStory, BuildContext context) {
    switch (currentStory?.media) {
      case MediaType.image:
        _animController?.duration = currentStory?.duration;
        _animController?.forward();
        break;
      case MediaType.video:
        _videoController =
            VideoPlayerController.network(currentStory?.url ?? "")
              ..initialize().then((_) {
                if (_videoController?.value.isInitialized == true) {
                  _animController?.duration = _videoController?.value.duration;
                  _videoController?.play();
                  _animController?.forward();
                  context.read<StoriesBloc>().add(VideoStoryInitialized());
                }
              });
        break;
      case null:
        break;
    }
  }

  void _onLongPressDown() {
    _animController?.stop();
    if (currentStory?.media == MediaType.video) {
      _videoController?.pause();
    }
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    _animController?.forward();
    if (currentStory?.media == MediaType.video) {
      _videoController?.play();
    }
  }

  void _onTapUp(TapUpDetails details, BuildContext context) {
    final double screenWidth = context.width;
    final double tapPosition = details.globalPosition.dx;
    _animController?.stop();
    _animController?.reset();
    if (tapPosition < screenWidth / 3) {
      context.read<StoriesBloc>().add(onUserTapLeftEvent());
    } else {
      context.read<StoriesBloc>().add(onUserTapRightEvent());
    }
  }
}
