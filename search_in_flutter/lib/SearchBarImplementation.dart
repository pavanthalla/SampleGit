import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CardsClass.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: SafeArea(
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
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cricketers = [
    "Rohit Sharma",
    "Virat Kohli",
    "Sachin Tendulkar",
    "Ms Dhoni",
    "Jasprit Bumrah",
    "Hardik Pandya",
    "Kieron Pollard",
    "Ravindra Jadeja",
    "David Warner",
    "AB devilliers",
  ];

  final recent = [
    "Hardik Pandya",
    "Kieron Pollard",
    "Ravindra Jadeja",
  ];
  List suggestionList = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions in app bar

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
    // Leading icon on the left of the app bar
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
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.blue,
          child: Center(
            child: Text(suggestionList[0].toString()),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Show some suggestions when someone searches

    suggestionList = query.isEmpty
        ? recent
        : cricketers.where((p) => p.startsWith(query)).toList();

//    slist = query.isEmpty
//        ? rct
//        : cards.where((p) => p.cname.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.person),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
    throw UnimplementedError();
  }
}
