import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagramstoryplayer/core/locale_manager.dart';
import 'package:instagramstoryplayer/data/data_provider.dart';
import 'package:instagramstoryplayer/model/story_model.dart';
import 'package:instagramstoryplayer/model/user_model.dart';
import 'package:instagramstoryplayer/screens/stories/stories_page_view.dart';
import 'package:instagramstoryplayer/screens/stories/stories_screen.dart';
import 'package:instagramstoryplayer/ui/story.dart';
import '/utils/screen_utils.dart';
import 'package:instagramstoryplayer/model/story_model.dart';

final double storyFieldHeight = 130;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<UserStoryUiModel> _usersWithStories;

  @override
  void initState() {
    super.initState();
    _usersWithStories = users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              height: storyFieldHeight,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _usersWithStories.length,
                  itemBuilder: ((context, index) => InkWell(
                        onTap: (() =>
                            (_openStory(_usersWithStories[index], index))),
                        child: Story(
                            username: _usersWithStories[index].name,
                            userProfileImageUrl:
                                _usersWithStories[index].profileImageUrl),
                      )))),
        ],
      ),
    );
  }

  void _openStory(UserStoryUiModel user, int index) {
    user.indexWhereUserLeft = user.isAllStoriesWatched()
        ? 0
        : LocaleManager.instance.getIntValue(user.name);
    users[index] = user;
    _usersWithStories = users;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StoriesPageView(
            userIndex: index, usersWithStories: _usersWithStories),
      ),
    );
  }
}
