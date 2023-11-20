import 'package:flutter/material.dart';
import 'package:les_mediateurs/core/constants.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class TeaserVideoContainer extends StatelessWidget {
  final _youtubePlayerController = YoutubePlayerController.fromVideoId(
    videoId: 'w7kTmia0h3g',
    autoPlay: false,
    params: const YoutubePlayerParams(
      showFullscreenButton: true,
    ),
  );

  TeaserVideoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width < mediumScreenCapWidth && size.width >= smallScreenCapWith) {
      return const SizedBox();
    }

    if (size.width < smallScreenCapWith) {
      return const SizedBox();
    }

    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: largeScreenDisplayWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Dernière vidéo du moment',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    wordSpacing: 0,
                  ),
                ),
                const SizedBox(height: 40),
                YoutubePlayer(
                  controller: _youtubePlayerController,
                  aspectRatio: 16 / 9,
                  backgroundColor: Colors.black,
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
