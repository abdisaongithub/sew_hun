import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/actions/get_post_detail.dart';
import 'package:sew_hun/models/post_detail.dart';
import 'package:sew_hun/static.dart';

class BlogDetailScreen extends StatefulWidget {
  static String id = 'BlogDetailScreen';

  const BlogDetailScreen({Key? key}) : super(key: key);

  @override
  _BlogDetailScreenState createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen>
    with SingleTickerProviderStateMixin {

  late PostDetail postDetail;
  final storage = FlutterSecureStorage();
  bool isLoading = true;
  bool isLoaded = false;


  late ScrollController _scrollController;
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    getCategoryPosts();
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

  getCategoryPosts() async {
    String? stringKey = await storage.read(key: 'current_post');
    int current_pk = int.parse(stringKey!);
    postDetail = await GetPostDetail.get_post_detail(current_pk);
    if (postDetail.title.contains('error')) {
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
        isLoaded = true;
      });
    }
    return postDetail;
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
        body: isLoading == false && isLoaded == true ? CustomScrollView(
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
                        tag: args.index.toString(),
                        child: Container(
                          height: 325,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/img/${args.img}',
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                                      child: Text(
                                        'Abdisa Tsegaye',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 2,),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
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
                                  backgroundImage: AssetImage(
                                    'assets/img/et.jpg',
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Text(
                              content[args.index]['title'].toString(),
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
                                  'Dec-20-2021',
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
                                  'Psychology',
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
                      content[args.index]['content'].toString(),
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
        ) : Center(child: CircularProgressIndicator(),),
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
  final int index;
  final String img;

  BlogArguments({required this.index, required this.img});
}
