import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyApp());
}

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}

class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

enum ScreenSize { Small, Normal, Large, ExtraLarge }

ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > 900) return ScreenSize.ExtraLarge;
  if (deviceWidth > 600) return ScreenSize.Large;
  if (deviceWidth > 300) return ScreenSize.Normal;
  return ScreenSize.Small;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.systemOrange,
      ),
      title: 'Kindacode.com',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key? key, required this.title}) : super(key: key);
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _tabs = [
    HomeTab(), // see the HomeTab class below
    SettingTab(), // see the SettingsTab class below
    HomeTab(), // see the HomeTab class below
    HomeTab(), // see the HomeTab class below
  ];

  @override
  Widget build(BuildContext context) {
    if (true) {
      return CupertinoPageScaffold(
          // navigationBar: CupertinoNavigationBar(
          // middle: Text('From Web'),
          // ),
          child: DesktopVersion());
    } else {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Kindacode.com'),
        ),
        child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Video'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_mall_outlined), label: 'Items'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'asd')
              ],
            ),
            tabBuilder: (BuildContext context, index) {
              return _tabs[index];
            }),
      );
    }
  }
}

// Home Tab
class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // EmbedVideoWidget(),
        // ItemDetails(),
        MobileItemDetails()
      ],
    );
  }
}

class EmbedVideoWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[200],
      child: Column(
        children: [
          Container(
            width: 400,
            child: Placeholder(
              color: Colors.white,
            ),
          ),
          Text(
              "Don't wait too long to bid! The video may be delayed by several seconds."),
          Text(
              "Read more about how live bidding works and what happens when you win."),
        ],
      ),
    );
  }
}

class MobileItemDetails extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      // height: 600,
      // width: 550,
      height: (MediaQuery.of(context).size.height),
      width: (MediaQuery.of(context).size.width),
      color: Colors.green[900],
      // margin: false ? const EdgeInsets.only(left: 50.0) : null,
      child: Column(
        children: [
          Container(
            child: Placeholder(
              color: Colors.white,
            ),
          ),
          Container(
            width: (MediaQuery.of(context).size.width),
            margin: EdgeInsets.only(top: 10.0),
            child: Text("Last Bid: 123 sek"),
          ),
          Container(
            width: (MediaQuery.of(context).size.width),
            margin: EdgeInsets.only(top: 10.0),
            child: CupertinoButton(
              color: Colors.pink[400],
              onPressed: () => {},
              child: Text("Join the bidding"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 100.0,
            ),
            width: 400.0,
            height: 115.0,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  height: 50.0,
                  color: Colors.red,
                ),
                Container(
                  height: 50.0,
                  color: Colors.green,
                ),
                Container(
                  height: 50.0,
                  color: Colors.red,
                ),
                Container(
                  height: 50.0,
                  color: Colors.green,
                ),
                Container(
                  height: 50.0,
                  color: Colors.red,
                ),
                Container(
                  height: 50.0,
                  color: Colors.green,
                ),
                Container(
                  height: 50.0,
                  color: Colors.red,
                ),
                Container(
                  height: 50.0,
                  color: Colors.green,
                ),
                Container(
                  height: 50.0,
                  color: Colors.red,
                ),
                Container(
                  height: 50.0,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      // height: 600,
      // width: 550,
      width: (MediaQuery.of(context).size.width),
      color: Colors.green[900],
      margin: false ? const EdgeInsets.only(left: 50.0) : null,
      child: Column(
        children: [
          Container(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              //  MainAxisAlignment.spaceBetween
              children: [
                // Image
                Container(
                  // alignment: Alignment.topCenter,
                  // width: (MediaQuery.of(context).size.width),
                  width: 200,
                  height: 200,
                  child: Placeholder(
                    color: Colors.white,
                  ),
                  // child: Padding(
                  //   padding: EdgeInsets.all(20.0),
                  //   child: Placeholder(
                  //     color: Colors.white,
                  //   ),
                  // ),
                ),
                // Description
                Container(
                  color: Colors.amber[900],
                  margin: const EdgeInsets.only(left: 40.0),
                  width: 200.0,
                  height: 200.0,
                  child: Column(
                    children: [
                      Text('Title'),
                      Text('Description'),
                      Text('highest bid'),
                      Text('123'),
                      Text('estimate'),
                      Text('32'),
                    ],
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // children:
                    //  [
                    //   Container(
                    //     margin: const EdgeInsets.all(1.0),
                    //     color: Colors.amber[600],
                    //     // width: 48.0,
                    //     // height: 48.0,
                    //     child: Column(

                    //     ),
                    //   ),
                    // ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40.0),
                  child: CupertinoButton(
                    color: Colors.pink[400],
                    onPressed: () => {},
                    child: Text("Join the bidding"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 100.0,
              ),
              width: 400.0,
              height: 115.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: 50.0,
                    color: Colors.red,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.green,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.red,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.green,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.red,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.green,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.red,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.green,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.red,
                  ),
                  Container(
                    height: 50.0,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemsHistory extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class DesktopVersion extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        padding: EdgeInsets.only(top: 50.0),
        color: Colors.blue[600],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EmbedVideoWidget(),
                ItemDetails(),
              ],
            ),
            ItemsHistory(),
          ],
        ),
      ),
      // navigationBar: CupertinoNavigationBar(
      //   middle: Text('Live'),
      // ),
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Row(
      //       children: [
      //         Expanded(
      //             flex: 1,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Container(
      //                   // width: 500,
      //                   // width: MediaQuery.of(context).size.width * 0.25,
      //                   // height: 200,
      //                   child: Placeholder(
      //                     color: Colors.white,
      //                   ),
      //                 ),
      //                 Text(
      //                     "Don't wait too long to bid! The video may be delayed by several seconds."),
      //                 Text(
      //                     "Read more about how live bidding works and what happens when you win."),
      //               ],
      //             )),
      //         // Column(
      //         //   crossAxisAlignment: CrossAxisAlignment.start,
      //         //   mainAxisAlignment: MainAxisAlignment.start,
      //         //   children: [
      //         //     Container(
      //         //       height: 100,
      //         //       width: 100,
      //         //       child: Padding(
      //         //         padding: EdgeInsets.all(20.0),
      //         //         child: Placeholder(
      //         //           color: Colors.white,
      //         //         ),
      //         //       ),
      //         //     ),
      //         //   ],
      //         // ),
      //         Expanded(
      //           flex: 1,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               Row(
      //                 children: [
      //                   Column(
      //                     children: [
      //                       Container(
      //                         margin: const EdgeInsets.all(10.0),
      //                         color: Colors.amber[200],
      //                         height: 100,
      //                         width: 100,
      //                         child: Padding(
      //                           padding: EdgeInsets.all(20.0),
      //                           child: Placeholder(
      //                             color: Colors.white,
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Column(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: [
      //                       Container(
      //                         margin: const EdgeInsets.all(10.0),
      //                         color: Colors.amber[600],
      //                         // width: 48.0,
      //                         // height: 48.0,
      //                         child: Column(
      //                           children: [
      //                             Text('Title'),
      //                             Text('Description'),
      //                             Text('highest bid'),
      //                             Text('123'),
      //                             Text('estimate'),
      //                             Text('32'),
      //                           ],
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //               Column(
      //                 children: [
      //                   CupertinoButton(
      //                     onPressed: () => {},
      //                     child: Text("Button"),
      //                   ),
      // Container(
      //   margin: EdgeInsets.symmetric(
      //     vertical: 20.0,
      //     horizontal: 200.0,
      //   ),
      //   width: 400.0,
      //   height: 400.0,
      //   child: ListView(
      //     scrollDirection: Axis.vertical,
      //     children: [
      //       Container(
      //         height: 50.0,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         height: 50.0,
      //         color: Colors.green,
      //       ),
      //       Container(
      //         height: 50.0,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         height: 50.0,
      //         color: Colors.green,
      //       ),
      //       Container(
      //         height: 50.0,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         height: 50.0,
      //         color: Colors.green,
      //       ),
      //       Container(
      //         height: 50.0,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         height: 50.0,
      //         color: Colors.green,
      //       ),
      //       Container(
      //         height: 50.0,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         height: 50.0,
      //         color: Colors.green,
      //       ),
      //     ],
      //   ),
      // ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      // Container(
      //   margin: EdgeInsets.symmetric(vertical: 20.0),
      //   height: 200.0,
      //   child: ListView(
      //     scrollDirection: Axis.horizontal,
      //     children: [
      //       Container(
      //         width: 160.0,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.blue,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.green,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.yellow,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.orange,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.blue,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.green,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.yellow,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.orange,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.blue,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.green,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.yellow,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.orange,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.blue,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.green,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.yellow,
      //       ),
      //       Container(
      //         width: 160.0,
      //         color: Colors.orange,
      //       ),
      //     ],
      //   ),
      // ),

      //     // Row(children: [
      //     //   Expanded(
      //     //       flex: 1,
      //     //       child: Column(
      //     //         crossAxisAlignment: CrossAxisAlignment.start,
      //     //         children: [
      //     //           Container(
      //     //             // width: 500,
      //     //             // width: MediaQuery.of(context).size.width * 0.25,
      //     //             // height: 200,
      //     //             child: Placeholder(
      //     //               color: Colors.white,
      //     //             ),
      //     //           ),
      //     //           Text(
      //     //               "Don't wait too long to bid! The video may be delayed by several seconds."),
      //     //           Text(
      //     //               "Read more about how live bidding works and what happens when you win."),
      //     //         ],
      //     //       )),
      //     //   Expanded(
      //     //     flex: 1,
      //     //     child: Text("Test"),
      //     //   )
      //     // ]),
      //   ],
      // ),
    );
  }
}

// Settings Tab
class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Tab'),
    );
  }
}
