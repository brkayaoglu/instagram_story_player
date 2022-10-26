import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:instagramstoryplayer/utils/screen_utils.dart';

final double storyCircleAvatarRadius = 30.0;
final double storyContainerWidth = 80;
final double storyContainerHeight = 90;
final Color? storyCircleBackgroundColor = Colors.grey[300];
final int usernameTextLimit = 10;
final double usernameTextFontSize = 12;

class Story extends StatelessWidget {
  final String username;
  final String userProfileImageUrl;

  const Story(
      {super.key, required this.username, required this.userProfileImageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: xxsmallSpace, top: smallSpace, bottom: xxsmallSpace),
      child: Container(
          width: storyContainerWidth,
          height: storyContainerHeight,
          child: Center(
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                      radius: storyCircleAvatarRadius,
                      backgroundColor: storyCircleBackgroundColor,
                      backgroundImage:
                          CachedNetworkImageProvider(this.userProfileImageUrl)),
                  SizedBox(
                    height: smallSpace,
                  ),
                  Text(
                    this.username.length > usernameTextLimit
                        ? this.username.substring(0, usernameTextLimit) + '...'
                        : this.username,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.grey, fontSize: usernameTextFontSize),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
