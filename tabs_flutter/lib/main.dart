import 'package:flutter/material.dart';
import 'package:tabsflutter/sample_tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      //Use HomePage for Top Tabs
      //Use MyHomePage(title: ) for Bottom
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  List<Widget> _tabList = [
    Container(
      color: Colors.teal,
      child: Center(
        child: Text(
          'home',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text(
          'home',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    ),
    Container(
      color: Colors.purple,
      child: Center(
        child: Text(
          'home',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    ),
    Container(
      color: Colors.yellowAccent,
      child: Center(
        child: Text(
          'home',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    )
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toUpperCase()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        currentIndex: _currentIndex,
        onTap: (currentIndex) {
          setState(() {
            _currentIndex = currentIndex;
          });

          _tabController.animateTo(_currentIndex);
        },
        items: [
          BottomNavigationBarItem(
              title: Text("Home"),
              icon: Icon(Icons.home),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              title: Text("Search"),
              icon: Icon(Icons.search),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              title: Text("Add"),
              icon: Icon(Icons.add),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              title: Text("Profile"),
              icon: Icon(Icons.account_circle),
              backgroundColor: Colors.black)
        ],
      ),
    );
  }
}
