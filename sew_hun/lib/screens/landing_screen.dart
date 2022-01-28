import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sew_hun/providers/blog/categories_provider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/blog_detail_screen.dart';
import 'package:sew_hun/screens/blog_list_screen.dart';
import 'package:sew_hun/static.dart';

class LandingScreen extends ConsumerStatefulWidget {
  static String id = 'LandingScreen';

  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        elevation: 6.0,
        child: LandingScreenDrawer(),
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
                  onTap: () {
                    print('Hello');
                    _globalKey.currentState!.openDrawer();
                  },
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
                Consumer(
                  builder:
                      (BuildContext context, WidgetRef ref, Widget? child) {
                    final category = ref.watch(categoryProvider);

                    return category.when(
                      data: (data) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.all(
                            smallPadding,
                          ),
                          child: Row(
                            children: [
                              for (var category in data.results!)
                                CategoryCard(
                                  category: category.category!,
                                  img: category.image!,
                                  id: category.id!,
                                )
                            ],
                          ),
                        );
                      },
                      error: (error, stack) {
                        return Center(
                          child: Text(error.toString()),
                        );
                      },
                      loading: () {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LandingScreenDrawer extends ConsumerWidget {
  const LandingScreenDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: 400,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: (){
              final state = ref.read(themeModeProvider.state);

              ref.read(themeModeProvider.state).state = state.state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
              print(ref.read(themeModeProvider.state).state);
            },
            title: Text(
              'Hello From Drawer',
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final storage = FlutterSecureStorage();
  final String category;
  final String img;
  final int id;

  CategoryCard({
    Key? key,
    required this.category,
    required this.img,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await storage.write(key: 'current_category', value: id.toString());
        Navigator.pushNamed(
          context,
          BlogListScreen.id,
          arguments: BlogListArgument(
            category: category,
            id: id,
          ),
        );
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
            image: NetworkImage(
              img,
            ),
            fit: BoxFit.cover,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
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

class PopularCard extends StatelessWidget {
  final String title;
  final String content;
  final String img;
  final int index;

  //TODO: Implement favorites ...
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
        Navigator.pushNamed(
          context,
          BlogDetailScreen.id,
          arguments: BlogArguments(
            id: index,
            img: img,
          ),
        );
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
