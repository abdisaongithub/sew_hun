import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/providers/blog/post_provider.dart';
import 'package:sew_hun/static.dart';

class BlogDetailScreen extends StatefulWidget {
  static String id = 'BlogDetailScreen';

  const BlogDetailScreen({Key? key}) : super(key: key);

  @override
  _BlogDetailScreenState createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen>
    with SingleTickerProviderStateMixin {


  late ScrollController _scrollController;
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
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

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.decelerate,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as BlogArguments;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: _showBackToTopButton == false
            ? null
            : FloatingActionButton(
                onPressed: _scrollToTop,
                mini: true,
                backgroundColor: Colors.purple,
                child: Icon(
                  Icons.arrow_upward,
                ),
              ),
        backgroundColor: Colors.white,
        body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final post = ref.watch(postProvider(args.id));
            return post.when(
              data: (data) {
                return CustomScrollView(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 350,
                      backgroundColor: Colors.white,
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
                                        data.image!,
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
                                          color: Colors.white,
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
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4, vertical: 0),
                                              child: Text(
                                                data.author!.username!,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 4, vertical: 0),
                                              child: Text(
                                                'Author',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white,
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
                                            data.author!.profile!.photo!,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Text(
                                      data.title!,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28,
                                      ),
                                    ),
                                    SizedBox(
                                      height: smallPadding,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          data.createdAt!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          ' - ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          data.category!.category!,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
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
                                        BlogDetailIconButton(
                                          iconData: Icons.fast_rewind,
                                          iconColor: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        BlogDetailIconButton(
                                          iconData: Icons.play_arrow,
                                          iconColor: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        BlogDetailIconButton(
                                          iconData: Icons.fast_forward,
                                          iconColor: Colors.black,
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            width: 8,
                                          ),
                                        ),
                                        BlogDetailIconButton(
                                          iconData: Icons.share,
                                          iconColor: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        BlogDetailIconButton(
                                          iconData: CupertinoIcons.heart_fill,
                                          iconColor: Colors.red,
                                        ),
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
                              style: TextStyle(
                                color: Colors.black,
                              ),
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
                return Center(child: Text(error.toString()));
              },
              loading: () => Center(
                child: CircularProgressIndicator(),
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
  final Color iconColor;

  const BlogDetailIconButton({
    required this.iconData,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 3,
              offset: Offset(1, 1),
            ),
          ],
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
            style: BorderStyle.solid,
            width: 0.2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Icon(
          iconData,
          color: iconColor,
          size: 19,
        ),
      ),
      onTap: () {},
    );
  }
}

class BlogArguments {
  final int id;
  final String img;

  BlogArguments({required this.id, required this.img});
}
