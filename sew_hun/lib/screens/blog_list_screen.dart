import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/providers/blog/blog_list_provider.dart';
import 'package:sew_hun/screens/blog_detail_screen.dart';
import 'package:sew_hun/static.dart';

class BlogListScreen extends ConsumerStatefulWidget {
  static String id = 'BlogListScreen';

  const BlogListScreen({Key? key}) : super(key: key);

  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends ConsumerState<BlogListScreen> {
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as BlogListArgument;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.category,
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final blogList = ref.watch(categoryPostsProvider(args.id));
            return blogList.when(
              data: (data) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: smallPadding,
                        left: smallPadding,
                        right: smallPadding,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var post in data.posts!)
                            BlogListContainer(
                              img: post.image!,
                              title: post.title!,
                              content: post.text!,
                              id: post.id!,
                            ),

                          Divider(),
                          // Divider(),
                        ],
                      )),
                );
              },
              error: (error, stack) {
                return Text(error.toString());
              },
              loading: () => Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}

class BlogListContainer extends StatelessWidget {
  final String img;
  final String title;
  final String content;
  final int id;

  const BlogListContainer({
    Key? key,
    required this.img,
    required this.title,
    required this.content,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.pushNamed(
          context,
          BlogDetailScreen.id,
          arguments: BlogArguments(
            id: id,
            img: 'et.jpg',
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: id.toString(),
              child: Container(
                margin: EdgeInsets.only(
                  right: defaultPadding,
                ),
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${baseUrl}${img.substring(1)}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    content,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  Text(
                    'read more ...',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogListArgument {
  final int id;
  final String category;

  BlogListArgument({required this.category, required this.id});
}
