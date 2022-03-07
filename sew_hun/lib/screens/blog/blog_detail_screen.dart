import 'package:audioplayers/audioplayers.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/blog/post.dart';
import 'package:sew_hun/providers/blog/post_provider.dart';
import 'package:sew_hun/providers/favorite/toggle_favorite_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/blog/comments_screen.dart';
import 'package:sew_hun/static.dart';
import 'package:share_plus/share_plus.dart';

class BlogDetailScreen extends ConsumerStatefulWidget {
  static String id = 'BlogDetailScreen';

  const BlogDetailScreen({Key? key}) : super(key: key);

  @override
  _BlogDetailScreenState createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends ConsumerState<BlogDetailScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  bool _showBackToTopButton = false;
  bool _isPlaying = false;
  bool _isFavorite = false;

  late AudioPlayer _player;

  Duration currentPosition = Duration();
  Duration totalLength = Duration();

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 300) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.decelerate,
    );
  }

  void play(
      {String url =
          'https://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3'}) async {
    _player.play(url);
    _isPlaying = true;
    // _player.play(data.narration!.first.audio.toString());
  }

  // void playPause() async {
  //   if (_isPlaying) {
  //     await _player.pause();
  //     _isPlaying = false;
  //   } else if (!_isPlaying) {
  //     await _player.resume();
  //     _isPlaying = true;
  //   }
  // }

  Future<void> stopPlayer() async {}

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BlogArguments;
    //
    // ref.listen(toggleFavoriteProvider, (previous, next) {
    //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //     final favsList = ref.watch(favListProvider);
    //     favsList.forEach(
    //       (element) {
    //         if (element.post!.id == args.id){
    //           setState(() {
    //             _isFavorite = true;
    //           });
    //           print('Current Favorite Post: ' + element.post!.id.toString());
    //         }
    //       },
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(
    //           'Added To Your Favorites',
    //         ),
    //       ),
    //     );
    //   });
    // });

    _player.onDurationChanged.listen((event) {
      setState(() {
        totalLength = event;
      });
    });
    _player.onAudioPositionChanged.listen((event) {
      setState(() {
        currentPosition = event;
      });
    });
    _player.onPlayerCompletion.listen((event) {
      setState(() {
        _isPlaying = false;
      });
    });
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _showBackToTopButton == false
            ? null
            : FloatingActionButton(
                onPressed: _scrollToTop,
                mini: true,
                backgroundColor: Theme.of(context).custom.textColor,
                child: Icon(
                  Icons.arrow_upward,
                ),
              ),
        backgroundColor: Theme.of(context).custom.appBarColor,
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final post = ref.watch(postProvider(args.id));

            return post.when(
              data: (data) {
                final narration = data.narration as List<Narration>;

                if (narration.length == 0) {
                  // pass
                  _player.setUrl(
                    'https://filesamples.com/samples/audio/mp3/sample1.mp3',
                  );
                } else {
                  // _player.setUrl(
                  //   data.narration!.first.audio.toString(),
                  // );
                  _player.setUrl(
                    'https://filesamples.com/samples/audio/mp3/sample1.mp3',
                  );
                }
                return CustomScrollView(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 350,
                      backgroundColor: Theme.of(context).custom.bgColor,
                      elevation: 0,
                      stretch: false,
                      floating: true,
                      automaticallyImplyLeading: false,
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Stack(
                          children: [
                            Positioned(
                              child: Hero(
                                tag: args.id.toString(),
                                child: Container(
                                  height: 325,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        baseUrl + data.image!.substring(1),
                                      ),
                                      fit: BoxFit.cover,
                                      repeat: ImageRepeat.noRepeat,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: smallPadding,
                                  right: smallPadding,
                                  bottom: smallPadding,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        BackButton(
                                          color: Theme.of(context)
                                              .custom
                                              .textColor,
                                        ),
                                        Expanded(
                                          child: SizedBox(),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .custom
                                                    .bgColor
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 4,
                                                vertical: 0,
                                              ),
                                              child: Text(
                                                data.author!.username!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Theme.of(context)
                                                      .custom
                                                      .textColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .custom
                                                    .bgColor
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 4,
                                                vertical: 0,
                                              ),
                                              child: Text(
                                                'Author',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: Theme.of(context)
                                                      .custom
                                                      .textColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        CircleAvatar(
                                          radius: 15,
                                          backgroundImage: NetworkImage(
                                            baseUrl +
                                                data.author!.profile!.photo!
                                                    .substring(1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .custom
                                            .bgColor
                                            .withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 0,
                                      ),
                                      child: Text(
                                        data.title!,
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .custom
                                            .textStyle
                                            .copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 28,
                                            ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: smallPadding,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .custom
                                                .bgColor
                                                .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 0,
                                          ),
                                          child: Text(
                                            DateTimeFormat.format(
                                              DateTime.parse(data.createdAt!),
                                              format: DateTimeFormats.american,
                                            ),
                                            style: Theme.of(context)
                                                .custom
                                                .textStyle
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          ' - ',
                                          style: Theme.of(context)
                                              .custom
                                              .textStyle
                                              .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .custom
                                                .bgColor
                                                .withOpacity(0.3),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 0,
                                          ),
                                          child: Text(
                                            data.category!.category!,
                                            style: Theme.of(context)
                                                .custom
                                                .textStyle
                                                .copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: smallPadding,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // BlogDetailIconButton(
                                        //   iconData: Icons.fast_rewind,
                                        // ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        BlogDetailIconButton(
                                          iconData: _isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          onTap: () {
                                            if (!_isPlaying) {
                                              _player.resume();
                                              setState(() {
                                                _isPlaying = true;
                                              });
                                            } else {
                                              _player.pause();
                                              setState(() {
                                                _isPlaying = false;
                                              });
                                            }
                                          },
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        BlogDetailIconButton(
                                          iconData: Icons.fast_forward,
                                          onTap: () async {
                                            final val = await _player
                                                .getCurrentPosition();
                                            print(val);
                                            _player.seek(
                                              Duration(
                                                  milliseconds: val + 10000),
                                            );
                                          },
                                        ),
                                        SizedBox(width: smallPadding),
                                        Container(
                                          height: 30,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .custom
                                                  .textColor
                                                  .withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Center(
                                            child: Text(
                                              '${currentPosition.toString().split('.')[0]} - ${totalLength.toString().split('.')[0]}',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .custom
                                                    .bgThemeColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: 8,
                                          ),
                                        ),
                                        BlogDetailIconButton(
                                          iconData: Icons.list_alt,
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              CommentsScreen.id,
                                              arguments: CommentArgument(
                                                  comments: data.comments!),
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        BlogDetailIconButton(
                                          iconData: Icons.share,
                                          onTap: () {
                                            if (data.text!.length >= 100) {
                                              Share.share(
                                                data.title! +
                                                    '\n' +
                                                    data.text!
                                                        .substring(0, 99) +
                                                    '\n\nread more...' +
                                                    '\n\nhttps://sew_hun.com',
                                              );
                                            } else {
                                              Share.share(
                                                data.title! +
                                                    '\n' +
                                                    data.text! +
                                                    ' \nread more...' +
                                                    '\n\nhttps://sew_hun.com',
                                              );
                                            }
                                          },
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        BlogDetailIconButton(
                                          iconData: ref
                                                      .watch(themeModeProvider
                                                          .state)
                                                      .state ==
                                                  ThemeMode.light
                                              ? Icons.wb_sunny_outlined
                                              : CupertinoIcons.moon_stars,
                                          onTap: () {
                                            final state = ref
                                                .read(themeModeProvider.state);

                                            ref
                                                .read(themeModeProvider.state)
                                                .state = state.state ==
                                                    ThemeMode.light
                                                ? ThemeMode.dark
                                                : ThemeMode.light;
                                          },
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        // BlogDetailIconButton(
                                        //   iconData: CupertinoIcons.heart_fill,
                                        //   iconColor: _isFavorite
                                        //       ? Colors.red
                                        //       : Theme.of(context)
                                        //           .custom
                                        //           .bgColor,
                                        //   onTap: () {
                                        //
                                        //   },
                                        // ), // TODO: implement this feature
                                        SizedBox(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.all(
                              smallPadding,
                            ),
                            child: Text(
                              data.text!,
                              textAlign: TextAlign.justify,
                              style:
                                  Theme.of(context).custom.textStyle.copyWith(),
                            ),
                          );
                        },
                        childCount: 1,
                      ),
                    ),
                  ],
                );
              },
              error: (error, stack) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Are you connected to the Internet?',
                        style: Theme.of(context).custom.textStyle,
                      ),
                      SizedBox(
                        height: smallPadding,
                      ),
                      TextButton(
                        onPressed: () {
                          ref.refresh(postProvider(args.id));
                        },
                        child: Text('Reload'),
                      ),
                    ],
                  ),
                );
              },
              loading: () => Center(
                child: Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class BlogDetailIconButton extends StatelessWidget {
  final IconData iconData;
  final Color? iconColor;
  final VoidCallback? onTap;

  const BlogDetailIconButton({
    required this.iconData,
    this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Theme.of(context).custom.textColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).custom.bgColor.withOpacity(0.3),
              blurRadius: 3,
              offset: Offset(1, 1),
            ),
          ],
          border: Border.all(
            color: Theme.of(context).custom.bgColor.withOpacity(0.2),
            style: BorderStyle.solid,
            width: 0.2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Icon(
          iconData,
          color: iconColor ?? Theme.of(context).custom.bgThemeColor,
          size: 19,
        ),
      ),
    );
  }
}

class BlogArguments {
  final int id;
  final bool? isFav;

  BlogArguments({this.isFav,required this.id});
}
