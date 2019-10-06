import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'SqliteHelper.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'https://jsonplaceholder.typicode.com/posts';
  final SqliteHelp = SqliteHelper();

  getAllPost() async {
    await SqliteHelp.open();
    return await SqliteHelp.queryAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.http),
          onPressed: () async {
            await SqliteHelp.open();
            var res = await http.get(url);
            List l = jsonDecode(res.body);
            l.forEach((e) async => await SqliteHelp.insert(e));
            setState(() {});
          }),
      appBar: AppBar(
        title: Text('Squlite in Flutter'),
      ),
      body: FutureBuilder(
        future: getAllPost(),
        builder: (context, snap) {
          if (snap.hasData) {
            List l = snap.data;
            return ListView.builder(
                itemCount: l.length,
                itemBuilder: (context, idx) {
                  return InkWell(
                    onTap: () async {
                      await SqliteHelp.delete(l[idx]['id']);
                      setState(() {});
                    },
                    child: ListTile(
                      title: Text(l[idx]['title']),
                    ),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }
}

//void main() =>
//    runApp(MaterialApp(
//      initialRoute: '/',
//      routes: {
//        '/': (context) {
//          return MyApp();
//        },
//        '/page2': (context) {
//          return Page2();
//        },
//      },
//    ));
//
//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('page1'),
//      ),
//      body: Container(
//        color: Colors.orange,
//      ),
//      floatingActionButton: FloatingActionButton(onPressed: () {
////        Navigator.pushNamed(context, '/page2');
//        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//          return Page2(
//            textData: 'abcd',
//          );
//        })).then((value) {
//          print(value);
//        });
//      }),
//    );
//  }
//}
//
//class Page2 extends StatelessWidget {
//  final String textData;
//
//  Page2({Key key, @required this.textData}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('page2'),
//      ),
//      body: SizedBox.expand(
//        child: Container(
//          color: Colors.greenAccent,
//          child: Text(textData),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          Navigator.pop(context, 'qweqsdadas');
//        },
//      ),
//    );
//  }
//}

//class MyApp extends StatefulWidget {
//  @override
//  _MyAppState createState() => _MyAppState();
//}
//
//class _MyAppState extends State<MyApp> {
//  int index = 0;
//  List<Widget> pages = [
//    Container(color: Colors.green),
//    Container(color: Colors.blue),
//    Container(color: Colors.deepOrangeAccent),
//    Container(color: Colors.orange)
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Scaffold(
//        appBar: new AppBar(
//          title: Text('高永典垃圾'),
//        ),
//        body: pages[index],
//        bottomNavigationBar: BottomNavigationBar(
//          onTap: (int idx) {
//            setState(() {
//              index = idx;
//            });
//          },
//          currentIndex: index,
//          type: BottomNavigationBarType.fixed,
//          items: [
//            BottomNavigationBarItem(
//                icon: Icon(Icons.add, color: Colors.black87),
//                title: Text('政', style: TextStyle(color: Colors.black87))),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.account_circle, color: Colors.black87),
//                title: Text('大', style: TextStyle(color: Colors.black87))),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.close, color: Colors.black87),
//                title: Text('生', style: TextStyle(color: Colors.black87))),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.build, color: Colors.black87),
//                title: Text('4NI', style: TextStyle(color: Colors.black87))),
//          ],
//        ));
//  }
//}

class gridviewtest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Gird View Demo';
    return new MaterialApp(
      title: 'Gird View Demo',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Grid View'),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children: List.generate(500, (index) {
            return Center(
              child: Text('Index:$index'),
            );
          }),
        ),
      ),
    );
  }
}

class imgtest extends StatelessWidget {
  final String banner =
      "https://www.easycanvasprints.com/Upload/mkt/PLA/ECP/BOTC-generic3.jpg";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Image demo'),
      ),
      body: Image.network(
        banner,
        height: 300,
        width: 1000,
        alignment: Alignment.center,
        fit: BoxFit.contain,
      ),
    );
  }
}

class testListViewBlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: Text('ListView'),
        ),
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              print(index);
              return Card(
                child: Container(
                  height: 150.0,
                  color: Colors.blue,
                  child: Text('$index'),
                ),
              );
            })); //ListView
  }
}

class testListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('ListView'),
      ),
      body: ListView(
        children: List.generate(10, (index) {
          return Card(
            child: Container(
              height: 150.0,
              color: Colors.green,
              child: Text('$index'),
            ),
          );
        }),
      ),
    );
  }
}

class testfirldtest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController Controller = new TextEditingController();
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('card'),
      ),
      body: TextField(
        controller: Controller,
        onChanged: (text) {
          print('onChanged');
          print(text);
        },
        onEditingComplete: () {
          print('onEditingComplete');
          print(Controller.text);
        },
        onSubmitted: (text) {
          print('onSubmitted');
          print(text);
        },
        decoration: new InputDecoration(
          icon: Icon(Icons.face),
          labelText: 'Name',
          suffix: IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),
          helperText: '輸入姓名',
          hintText: '輸入姓名',
        ),
      ),
    );
  }
}

class CardTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('card'),
        ),
        body: Container(
          child: SizedBox(
            width: 100.0,
            height: 300.0,
            child: Card(
              child: Text(' card本身 '),
            ),
          ),
        ));
  }
}

class ContainerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true ; //看邊界
    return Scaffold(
        appBar: new AppBar(
          title: Text('title'),
        ), //AppBar
        body: Container(
          padding: EdgeInsets.all(20.0),
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.green,
          ), //decoration

          child: Text(
            'this is container',
            style: TextStyle(fontSize: 20.0), //TextStyle
          ), //Text
        ) //Container
        ); //Scaffold
  }
}

class TREE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: Text('StatelessWidget'),
        ), //appbar
        body: Row(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 100.0,
              height: 100.0,
            ), //container
            Container(
              margin: EdgeInsets.only(left: 10.0),
              color: Colors.blue,
              width: 100.0,
              height: 100.0,
            ), //container
          ], //widge
        ) //row
        ); //scaffold
  } //build
} //stateless

class HomePage2 extends StatefulWidget {
  @override
  HomePage2State createState() => HomePage2State();
}

class HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.ac_unit),
          onPressed: () {
            setState(() {}); //
          },
        ), //FloatingActionButton
        appBar: new AppBar(
          title: Text('StatefulWidget'),
        ), //appbar
        body: Row(
          children: <Widget>[
            Container(
              color: getColor(),
              width: 100.0,
              height: 100.0,
            ), //container
            Container(
              margin: EdgeInsets.only(left: 10.0),
              color: getColor(),
              width: 100.0,
              height: 100.0,
            ), //container
          ], //widge
        ) //row
        ); //scaffold
  }

  ///FUNCTION
  Color getColor() {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  } //color
} //statefromHomePage2
