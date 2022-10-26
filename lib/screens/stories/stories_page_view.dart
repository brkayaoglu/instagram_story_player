import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagramstoryplayer/screens/stories/bloc/bloc.dart';
import 'package:instagramstoryplayer/screens/stories/stories_screen.dart';

import '../../model/user_model.dart';

class StoriesPageView extends StatefulWidget {
  final int userIndex;
  final List<UserStoryUiModel> usersWithStories;
  const StoriesPageView(
      {super.key, required this.userIndex, required this.usersWithStories});

  @override
  State<StoriesPageView> createState() => _StoriesPageViewState();
}

class _StoriesPageViewState extends State<StoriesPageView> {
  PageController? _pageController;
  var currentPage = 0.0;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.userIndex);
    currentPage = widget.userIndex.toDouble();
    _pageController?.addListener(() {
      setState(() {
        currentPage = _pageController?.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StoriesBloc(),
      child: BlocBuilder<StoriesBloc, StoriesState>(builder: ((context, state) {
        return PageView.builder(
            controller: _pageController,
            itemCount: widget.usersWithStories.length,
            itemBuilder: (context, index) {
              final isLeaving = (index - currentPage) <= 0;
              final t = (index - currentPage);
              final rotationY = lerpDouble(0, 30, t as double)!;
              final maxOpacity = 0.8;
              final num opacity =
                  lerpDouble(0, maxOpacity, t.abs())!.clamp(0.0, maxOpacity);
              final isPaging = opacity != maxOpacity;
              final transform = Matrix4.identity();
              transform.setEntry(3, 2, 0.003);
              transform.rotateY(-rotationY * (pi / 180.0));
              return Transform(
                transform: transform,
                alignment:
                    isLeaving ? Alignment.centerRight : Alignment.centerLeft,
                child: StoriesScreen(
                    user: widget.usersWithStories[index], storyIndex: 0),
              );
            });
      })),
    );
  }

  List<Widget> getStories() {
    List<Widget> childs = [];
    for (var i = 0; i < widget.usersWithStories.length; i++) {
      childs.add(
          new StoriesScreen(user: widget.usersWithStories[i], storyIndex: 0));
    }
    return childs;
  }
}
