
import 'dart:async';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:testapp/widget/banner.dart';
import 'package:testapp/widget/marks.dart';

void main() {runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
   double _expandedHeight = 0.0; // Initial height is 0
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

      final List _gridItems = List.generate(90, (i) => "Item $i");



  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    // _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  // void _scrollListener() {
  //   setState(() {
  //     // _showAppBar = _scrollController.position.pixels < 0.0; // Show the app bar if the scroll position is near the top
  //   });
  // }

  void _showAppBarAfterPull() {
    setState(() {
      _expandedHeight = 300.0; // Show the expanded height
    });
    _timer = Timer(Duration(seconds: 3), () {
      // Hide the expanded height after 3 seconds
      setState(() {     
        _expandedHeight = 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification && notification.scrollDelta! < 0  ) {
            // If the user is pulling down
            _showAppBarAfterPull();
          }
          return true;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              surfaceTintColor: Colors.transparent,
          // floating: true,
          pinned: true,
          expandedHeight:_expandedHeight,
          // backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          flexibleSpace: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                Padding(
                padding: const EdgeInsets.only(left: 11,),
                    child: IconButton(
                        icon: const Icon(Icons.search),
                        iconSize: 32,
                        onPressed: () {},
                      ),
                ),
              SafeArea(
                child: Container(
                  width: 150,
                  child: FlexibleSpaceBar(         
                        titlePadding: EdgeInsetsDirectional.only( bottom: 11),
                       expandedTitleScale: 1,
                    centerTitle: true,title: Column(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                         Text('location:',style: TextStyle(color: Colors.grey,fontSize: 13,fontWeight: FontWeight.bold),),
                          Text('New Nork',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                      
                    ],
                  )),
                ),
              ), Padding(
                                 padding: const EdgeInsets.only(right: 11,bottom: 11),
                                 
                                   child: badges.Badge(        badgeContent: Text('3'),
                                             position: badges.BadgePosition.topEnd(top: -8,end: -6 ),  
                                     child: CircleAvatar(radius: 18,
                                              backgroundColor: Color.fromARGB(255, 237, 236, 236),
                                          child: Image.network("https://img.freepik.com/free-photo/bohemian-man-with-his-arms-crossed_1368-3542.jpg?size=626&ext=jpg&ga=GA1.2.1112128298.1677331631&semt=sph"),
                                             ),
                                   ),
                               ),
                             
            ],
          ),
        ),
            SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Popular Shoes",style: TextStyle(fontSize: 22,color: Colors.black),),
                  Text("Veiw all"),
                ],
              ),
            )
          ),
          SliverToBoxAdapter(
            child: navcategory(),
          ),
          SliverToBoxAdapter(
            child: blackBanner(),
          ),
          SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1,
                mainAxisExtent: 200,
                     ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Stack(
                    children: [ 
                  ClipRRect(    
                     borderRadius: BorderRadius.circular(30),
                        child: Card(
                          surfaceTintColor: Colors.transparent,
                          // generate blues with random shades
                          color: Colors.white,
                          child:   Padding(
                            padding: const EdgeInsets.all(11.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top:15),
                                  child: Image.asset("assets/marks/in.png",height: 100,),
                                ),
                                 Text("Sneakers Skate",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text("\$15.00",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                                      Row(
                                        children: [
                                            Icon(Icons.star, size: 15,color: Colors.amber,),
                                          Text('4.8', style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.normal),),
                                        ],
                                      ),
                                          
                                      
                                ],)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(left: 10,top: 8,
                     child: IconButton(
                               icon: const Icon(Icons.favorite_border),
                               iconSize: 22,
                               onPressed: () {},
                             ),),
                    ],
                  );
                },
                childCount: _gridItems.length,
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
