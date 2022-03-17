import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/providers/youtube/channel_provider.dart';
import 'package:sew_hun/providers/youtube/current_video_id_provider.dart';
import 'package:sew_hun/providers/youtube/videos_provider.dart';
import 'package:sew_hun/screens/components/LoadingError.dart';
import 'package:sew_hun/screens/components/LoadingIndicator.dart';
import 'package:sew_hun/screens/youtube/youtube_video_player_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeVideosScreen extends ConsumerStatefulWidget {
  static String id = 'YoutubeVideosScreen';

  const YoutubeVideosScreen({Key? key}) : super(key: key);

  @override
  _YoutubeVideosScreenState createState() => _YoutubeVideosScreenState();
}

class _YoutubeVideosScreenState extends ConsumerState<YoutubeVideosScreen> {
  launchYoutubeApp() async {
    const url = 'https://www.youtube.com/channel/UCyEPtN21cZOvL4YyCVDo_BA';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: 'Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final channel = ref.watch(channelProvider);
    final videos = ref.watch(videosProvider);
    return Scaffold(
      appBar: AppBar(
        title: channel.when(
          data: (ch) {
            return Text(
              ch.title,
              style: Theme.of(context).custom.textStyle,
            );
          },
          error: (error, st) => LoadingError(
            onTap: () {
              ref.refresh(videosProvider);
            },
          ),
          loading: () => LoadingIndicator(),
        ),
        backgroundColor: Theme.of(context).custom.appBarColor,
        leading: BackButton(
          color: Theme.of(context).custom.textColor,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: Theme.of(context).custom.defaultPadding,
            ),
            child: GestureDetector(
              onTap: launchYoutubeApp,
              child: Icon(
                Icons.ondemand_video_sharp,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(
          Theme.of(context).custom.smallPadding.toDouble(),
        ),
        child: videos.when(
          data: (video) {
            return ListView.builder(
              itemCount: video.length,
              itemBuilder: (context, index) {
                print(video[index].id.value);
                return ListTile(
                  onTap: () {
                    ref.watch(currentVideoIdProvider.state).state =
                        video[index].id.value;
                    Navigator.pushNamed(
                      context,
                      YoutubeVideoPlayerScreen.id,
                      arguments: VideoArgument(
                        title: video[index].title,
                      ),
                    );
                  },
                  leading: Container(
                    height: 60,
                    width: 70,
                    child: Image(
                      image: NetworkImage(
                        video[index].thumbnails.highResUrl,
                      ),
                      errorBuilder: (context, obj, st) {
                        return Image(
                          image: AssetImage(
                            'assets/img/et.jpg',
                          ),
                          //TODO: prepare default image
                          fit: BoxFit.cover,
                        );
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    video[index].title,
                  ),
                  contentPadding: EdgeInsets.all(8),
                );
              },
            );
          },
          error: (error, st) {
            print(error.toString());
          },
          loading: () {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );
  }
}
