import 'package:flutter/material.dart';
import 'package:sew_hun/actions/get_categories.dart';
import 'package:sew_hun/models/categories.dart';
import 'package:sew_hun/screens/blog_detail_screen.dart';
import 'package:sew_hun/screens/blog_list_screen.dart';
import 'package:sew_hun/static.dart';

class LandingScreen extends StatefulWidget {
  static String id = 'LandingScreen';

  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late Categories categories;
  final GlobalKey _globalKey = GlobalKey();

  bool isLoading = true;
  bool isLoaded = false;


  getCategories() async {
    categories = await GetCategories.get_categories() as Categories;
    if(categories.category.contains('error')){
      print(categories.category);
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        elevation: 6.0,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 400,
          color: Colors.green,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: smallPadding,
                ),
                Text(
                  'Hello',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Let\'s Explore Today',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                isLoaded == true && isLoading == false ? //TODO: show message for when there is no connection
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(
                    smallPadding,
                  ),
                  child: Row(
                    children: [
                      CategoryCard(
                        category: 'Politics',
                        img: 'baby.png',
                      ),
                      CategoryCard(
                        category: 'News',
                        img: 'merriage.png',
                      ),
                      CategoryCard(
                        category: 'Sports',
                        img: 'conflict.png',
                      ),
                      CategoryCard(
                        category: 'News',
                        img: 'postnatal.png',
                      ),
                      CategoryCard(
                        category: 'Sports',
                        img: 'tale.png',
                      ),
                    ],
                  ),
                ) : CircularProgressIndicator(color: Colors.black, ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Recommended',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                PopularCard(
                  title: content[0]['title'].toString(),
                  content: content[0]['content'].toString(),
                  index: 0,
                  img: 'tale.png',
                ),
                SizedBox(
                  height: 10,
                  child: Divider(
                    thickness: 2,
                    endIndent: 4,
                    indent: 4,
                  ),
                ),
                PopularCard(
                  title: content[1]['title'].toString(),
                  content: content[1]['content'].toString(),
                  index: 1,
                  img: 'merriage.png',
                ),
                SizedBox(
                  height: 10,
                  child: Divider(
                    thickness: 2,
                    endIndent: 4,
                    indent: 4,
                  ),
                ),
                PopularCard(
                  title: content[2]['title'].toString(),
                  content: content[2]['content'].toString(),
                  index: 2,
                  img: 'baby.png',
                ),
                SizedBox(
                  height: 10,
                  child: Divider(
                    thickness: 2,
                    endIndent: 4,
                    indent: 4,
                  ),
                ),
                PopularCard(
                  title: content[3]['title'].toString(),
                  content: content[3]['content'].toString(),
                  index: 3,
                  img: 'conflict.png',
                ),
                SizedBox(
                  height: 10,
                  child: Divider(
                    thickness: 2,
                    endIndent: 4,
                    indent: 4,
                  ),
                ),
                PopularCard(
                  title: content[4]['title'].toString(),
                  content: content[4]['content'].toString(),
                  index: 4,
                  img: 'postnatal.png',
                ),
                SizedBox(
                  height: 10,
                  child: Divider(
                    thickness: 2,
                    endIndent: 4,
                    indent: 4,
                  ),
                ),
                PopularCard(
                  title: content[5]['title'].toString(),
                  content: content[5]['content'].toString(),
                  index: 5,
                  img: 'inattentiveness.png',
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final String img;

  const CategoryCard({
    Key? key,
    required this.category,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BlogListScreen.id);
      },
      child: Container(
        margin: EdgeInsets.only(
          right: defaultPadding,
        ),
        width: 170,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 3,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(
              'assets/img/$img',
            ),
            fit: BoxFit.cover,
            // colorFilter: ColorFilter.mode(
            //   Colors.black87,
            //   BlendMode.dstATop,
            // ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: defaultPadding,
            bottom: defaultPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularCard extends StatelessWidget {
  final String title;
  final String content;
  final String img;
  final int index;

  const PopularCard({
    Key? key,
    required this.title,
    required this.content,
    required this.index,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BlogDetailScreen.id,
            arguments: BlogArguments(index: index, img: img));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Hero(
              tag: index.toString(),
              child: Container(
                margin: EdgeInsets.only(
                  right: defaultPadding,
                ),
                width: 100,
                height: 130,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/img/$img',
                      ),
                      fit: BoxFit.cover,
                      // colorFilter: ColorFilter.mode(
                      //   Colors.black87,
                      //   BlendMode.dstATop,
                      // ),
                    )),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? (title.length > 10
                          ? title.substring(0, 15) + '...'
                          : title)
                      : title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Text(
                  content.substring(0, 20) + '...',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 30),
                Text(
                  'read more ...',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
