import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/youtube/current_video_id_provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';

class YoutubeVideoPlayerScreen extends ConsumerStatefulWidget {
  static String id = 'YoutubeVideosPlayerScreen';

  const YoutubeVideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _YoutubeVideoPlayerScreenState createState() =>
      _YoutubeVideoPlayerScreenState();
}

class _YoutubeVideoPlayerScreenState
    extends ConsumerState<YoutubeVideoPlayerScreen> {
  late YoutubePlayerController _youtubePlayerController;

  // TODO: open current video in Youtube app

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: ref.read(currentVideoIdProvider.state).state,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: true,
      ),
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as VideoArgument;
    return WillPopScope(
      onWillPop: () async {
        if (MediaQuery.of(context).orientation == Orientation.landscape){
          _youtubePlayerController.toggleFullScreenMode();
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: MediaQuery.of(context).orientation == Orientation.portrait ? AppBar(
          leading: BackButton(color: Theme.of(context).custom.textColor,),
          title: Text(
            args.title,
            style: Theme.of(context).custom.textStyle,
          ),
          backgroundColor: Theme.of(context).custom.appBarColor,
        ) : null,
        body: SafeArea(
          top: true,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: YoutubePlayer(
                    controller: _youtubePlayerController,
                    showVideoProgressIndicator: true,
                    liveUIColor: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoArgument{
  final String title;
  VideoArgument({required this.title});
}