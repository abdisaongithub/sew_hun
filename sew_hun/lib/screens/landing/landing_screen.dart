import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sew_hun/providers/blog/random_posts_provider.dart';
import 'package:sew_hun/providers/landing/landingProvider.dart';
import 'package:sew_hun/providers/theme/theme_provider.dart';
import 'package:sew_hun/screens/about/about_screen.dart';
import 'package:sew_hun/screens/blog/blog_detail_screen.dart';
import 'package:sew_hun/screens/blog/blog_list_screen.dart';
import 'package:sew_hun/screens/blog/search_result_screen.dart';
import 'package:sew_hun/screens/chat/chats_screen.dart';
import 'package:sew_hun/screens/payment/payment_screen.dart';
import 'package:sew_hun/screens/profile/profile_screen.dart';
import 'package:sew_hun/screens/youtube/youtube_videos_screen.dart';
import 'package:sew_hun/static.dart';
import 'package:cached_network_image/cached_network_image.dart';


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
    final landing = ref.watch(landingProvider);
    return WillPopScope(
      onWillPop: () async {
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Press back again to exit')));
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                'assets/img/landing.svg',
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: landing.when(
                data: (data) {
                  return Container(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        // color: Theme.of(context).custom.bgColor,
                        ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: defaultPadding,
                          ),
                          // Text(
                          //   'Hello',
                          //   style: Theme.of(context).custom.textStyle.copyWith(
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 18,
                          //       ),
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hello User',
                                style:
                                    Theme.of(context).custom.textStyle.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                        ),
                              ),
                              Expanded(
                                child: SizedBox(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, SearchResultScreen.id);
                                },
                                child: Icon(
                                  Icons.search,
                                  size: 34,
                                  color: Theme.of(context).custom.textColor,
                                ),
                              ),
                              SizedBox(
                                width: smallPadding,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 32,
                                  width: 60,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).custom.pillColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tag',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  width: 60,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).custom.pillColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tag',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  width: 60,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).custom.pillColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tag',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  width: 60,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).custom.pillColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tag',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  width: 60,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).custom.pillColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tag',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  width: 60,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).custom.pillColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tag',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  width: 60,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).custom.pillColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tag',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  width: 60,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).custom.pillColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tag',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 32,
                                  width: 60,
                                  margin: EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).custom.pillColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tag',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Categories',
                            style: Theme.of(context).custom.textStyle.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(
                              smallPadding,
                            ),
                            child: Row(
                              children: [
                                for (var category in data.categories!)
                                  CategoryCard(
                                    category: category.category!,
                                    img: category.image!,
                                    id: category.id!,
                                  )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ref.watch(randomPostProvider).when(
                            data: (res) {
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Top Picks',
                                      style: Theme.of(context)
                                          .custom
                                          .textStyle
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                    ),
                                    SizedBox(
                                      height: smallPadding,
                                    ),
                                    for (var post in res.data!)
                                      BlogListTile(
                                        title: post.title!,
                                        content: post.text!,
                                        img: post.image!,
                                        index: post.id!,
                                      )
                                  ],
                                ),
                              );
                            },
                            error: (error, st) {
                              return SizedBox();
                            },
                            loading: () {
                              return SizedBox();
                            },
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          ref.watch(randomPostProvider).when(
                            data: (res) {
                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Previously Read',
                                      style: Theme.of(context)
                                          .custom
                                          .textStyle
                                          .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18,
                                          ),
                                    ),
                                    SizedBox(
                                      height: smallPadding,
                                    ),
                                    for (var post in res.data!)
                                      BlogListTile(
                                        title: post.title!,
                                        content: post.text!,
                                        img: post.image!,
                                        index: post.id!,
                                      )
                                  ],
                                ),
                              );
                            },
                            error: (error, st) {
                              return SizedBox();
                            },
                            loading: () {
                              return SizedBox();
                            },
                          ),
                          // data.favorites!.isNotEmpty
                          //     ? Text(
                          //         'My Favorites',
                          //         style:
                          //             Theme.of(context).custom.textStyle.copyWith(
                          //                   fontWeight: FontWeight.w500,
                          //                   fontSize: 18,
                          //                 ),
                          //       )
                          //     : Center(
                          //         child: Text(
                          //           'No Favorites Yet ...',
                          //           style:
                          //               Theme.of(context).custom.textStyle.copyWith(
                          //                     fontWeight: FontWeight.w500,
                          //                     fontSize: 18,
                          //                   ),
                          //         ),
                          //       ),
                          // SizedBox(
                          //   height: Theme.of(context).custom.smallPadding,
                          // ),
                          // for (var fav in data.favorites!)
                          //   FavoriteCard(
                          //     title: fav.post!.title.toString(),
                          //     content: fav.post!.text.toString(),
                          //     index: fav.post!.id!.toInt(),
                          //     img: fav.post!.image.toString(),
                          //   ),
                        ],
                      ),
                    ),
                  );
                },
                error: (error, st) {
                  // if (ref.read(networkErrorProvider.notifier).state!.type ==
                  //     DioErrorType.response) {
                  //   Navigator.popAndPushNamed(context, LoginScreen.id);
                  // }

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
                            ref.refresh(landingProvider);
                          },
                          child: Text('Reload'),
                        ),
                      ],
                    ),
                  );
                },
                loading: () {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        Text('Loading...'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  // final storage = FlutterSecureStorage();
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
            image: CachedNetworkImageProvider(
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
                padding: EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 0,
                ),
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

class BlogListTile extends StatelessWidget {
  final String title;
  final String content;
  final String img;
  final int index;

  const BlogListTile({
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
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: smallPadding),
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: defaultPadding,
              ),
              width: 100,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    img,
                  ),
                  fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode(
                  //   Colors.black87,
                  //   BlendMode.dstATop,
                  // ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? (title.length > 15
                          ? title.substring(0, 14) + '...'
                          : title)
                      : title,
                  style: Theme.of(context).custom.textStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                ),
                Text(
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? (content.length > 20
                          ? content.substring(0, 19) + '...'
                          : content)
                      : content.substring(0, 50),
                  style: Theme.of(context).custom.textStyle.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 30),
                Text(
                  'read more ...',
                  style: Theme.of(context).custom.textStyle.copyWith(
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

// class LandingScreenDrawer extends ConsumerWidget {
//   const LandingScreenDrawer({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: 400,
//       decoration: BoxDecoration(
//         color: Theme.of(context).custom.bgColor,
//       ),
//       padding: EdgeInsets.all(Theme.of(context).custom.smallPadding),
//       child: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Container(
//                     width: 60,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                         Theme.of(context).custom.defaultPadding,
//                       ),
//                       image: DecorationImage(
//                         image: AssetImage('assets/img/logo.png'),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: Theme.of(context).custom.smallPadding,
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Sew Hun Kesewm Sew Hun',
//                         textAlign: TextAlign.center,
//                         // 'Hello 👋',
//                         style: Theme.of(context).custom.textStyle.copyWith(
//                               color: Theme.of(context).custom.textColor,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                             ),
//                         maxLines: 2,
//                       ),
//                       SizedBox(
//                         height: Theme.of(context).custom.smallPadding,
//                       ),
//                       Text(
//                         '',
//                         style: Theme.of(context).custom.textStyle.copyWith(
//                               color: Theme.of(context).custom.textColor,
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                             ),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: SizedBox(),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       final state = ref.read(themeModeProvider.state);
//
//                       ref.read(themeModeProvider.state).state =
//                           state.state == ThemeMode.light
//                               ? ThemeMode.dark
//                               : ThemeMode.light;
//                     },
//                     child: Icon(
//                       ref.watch(themeModeProvider.state).state ==
//                               ThemeMode.light
//                           ? Icons.wb_sunny_outlined
//                           : CupertinoIcons.moon_stars,
//                     ),
//                   ),
//                 ],
//               ),
//               Divider(
//                 color: Theme.of(context).custom.textColor,
//                 indent: Theme.of(context).custom.smallPadding,
//                 endIndent: Theme.of(context).custom.smallPadding,
//                 thickness: 0.5,
//               ),
//               DrawerItems(
//                 iconData: Icons.message,
//                 label: 'Chats',
//                 // number: 2,
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, ChatsScreen.id);
//                 },
//               ),
//               DrawerItems(
//                 iconData: Icons.ondemand_video_sharp,
//                 label: 'Latest Videos',
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(
//                     context,
//                     YoutubeVideosScreen.id,
//                   );
//                 },
//               ),
//               DrawerItems(
//                 iconData: Icons.person,
//                 label: 'Profile',
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(
//                     context,
//                     ProfileScreen.id,
//                   );
//                 },
//               ),
//               // DrawerItems(
//               //   iconData: Icons.settings,
//               //   label: 'Settings',
//               //   onTap: () {
//               //     Navigator.pop(context);
//               //     Navigator.pushNamed(context, SettingsScreen.id);
//               //     // TODO: NNavigate to SettingsScreen
//               //   },
//               // ),
//               DrawerItems(
//                 iconData: Icons.attach_money,
//                 label: 'Payments',
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, PaymentsScreen.id);
//                   // TODO: NNavigate to SettingsScreen
//                 },
//               ),
//
//               Divider(
//                 color: Theme.of(context).custom.textColor,
//                 indent: Theme.of(context).custom.smallPadding,
//                 endIndent: Theme.of(context).custom.smallPadding,
//                 thickness: 0.5,
//               ),
//               DrawerItems(
//                 iconData: Icons.help,
//                 label: 'About',
//                 onTap: () {
//                   Navigator.pop(context);
//                   Navigator.pushNamed(context, AboutScreen.id);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class DrawerItems extends StatelessWidget {
//   final IconData iconData;
//   final String label;
//   final int? number;
//   final VoidCallback? onTap;
//
//   const DrawerItems({
//     Key? key,
//     required this.iconData,
//     required this.label,
//     this.number,
//     this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 40.0,
//         child: Row(
//           children: [
//             Icon(
//               iconData,
//               color: Theme.of(context).custom.textColor,
//               size: 24,
//             ),
//             SizedBox(
//               width: Theme.of(context).custom.smallPadding,
//             ),
//             Text(
//               label,
//               style: Theme.of(context).custom.textStyle.copyWith(
//                     fontSize: 18,
//                   ),
//             ),
//             Expanded(
//               child: SizedBox(),
//             ),
//             CircleAvatar(
//               radius: 14,
//               backgroundColor: Colors.transparent,
//               child: Text(
//                 number != null ? number.toString() : '',
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
