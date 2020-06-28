import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CardsClass.dart';

void main() {
  runApp(TabsApp());
}

class TabsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

List<Widget> containers = [
  SafeArea(
    child: Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.orangeAccent,
                offset: Offset(7, 7),
                blurRadius: 10,
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'BreakFast',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0,
                  color: Colors.orange[500],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return Row(
                      children: <Widget>[
                        Cards('Idly', 20, 25, 'idli'),
                        Cards('IdlyWada', 23, 30, 'idli_wada'),
                        Cards('Parota', 50, 30, 'parota'),
                        Cards('Masala Dosa', 50, 30, 'masala_dosa'),
                      ],
                    );
                  })),
          SizedBox(
            height: 10.0,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.orangeAccent,
                offset: Offset(7, 7),
                blurRadius: 10,
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' Lunch',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0,
                  color: Colors.orange[500],
                ),
              ),
            ),
          ),
          Container(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return Row(
                      children: <Widget>[
                        Cards('Biryani', 20, 100, 'biryani'),
                        Cards('Meals', 50, 70, 'meals'),
                      ],
                    );
                  })),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.orangeAccent,
                offset: Offset(7, 7),
                blurRadius: 10,
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ' Snacks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27.0,
                  color: Colors.orange[500],
                ),
              ),
            ),
          ),
          Container(
              height: 220,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (_, index) {
                    return Row(
                      children: <Widget>[Cards('Samosa', 50, 20, 'samosa')],
                    );
                  })),
        ],
      ),
    ),
  ),
  Container(color: Colors.yellowAccent, child: Text('search')),
  Container(
    color: Colors.lightBlue,
    child: Center(
        child: Text(
      'Add',
      style: TextStyle(fontSize: 30),
    )),
  ),
  Container(
    color: Colors.tealAccent,
    child: Center(
        child: Text(
      'Profile',
      style: TextStyle(fontSize: 30),
    )),
  ),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange[500],
            flexibleSpace: TabBar(
              tabs: <Widget>[
                Center(
                  child: Tab(
                    icon: Icon(
                      Icons.home,
                      size: 25,
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
                Center(
                  child: Tab(
                      icon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(context: context, delegate: CardsSearch());
                    },
                  )),
                ),
                Center(
                  child: Tab(
                    icon: Icon(
                      Icons.add,
                      size: 25,
                      color: CupertinoColors.white,
                    ),
                  ),
                ),
                Center(
                  child: Tab(
                    icon: Icon(
                      Icons.account_circle,
                      size: 25,
                      color: CupertinoColors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: containers,
            physics: new NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}

class CardsSearch extends SearchDelegate<Widget> {
  final cards = [
    Cards('Biryani', 23, 32, 'biryani'),
    Cards('Idly', 20, 25, 'idli'),
    Cards('IdlyWada', 23, 30, 'idli_wada'),
    Cards('Parota', 50, 30, 'parota'),
    Cards('Masala Dosa', 50, 30, 'masala_dosa'),
    Cards('Meals', 50, 70, 'meals'),
    Cards('Samosa', 50, 20, 'samosa')
  ];
  final recentCards = [
    Cards('Biryani', 23, 32, 'biryani'),
    Cards('Idly', 20, 25, 'idli'),
  ];
  List<Widget> sugList = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        child: Card(
          color: Colors.blue,
          child: Center(
            child: sugList[0],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    sugList = query.isEmpty
        ? recentCards
        : cards
            .where((p) => p.cname.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        title: sugList[index],
      ),
      itemCount: sugList.length,
    );
    throw UnimplementedError();
  }
}
