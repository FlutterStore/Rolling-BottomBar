import 'package:flutter/material.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rolling Bottom Bar',style: TextStyle(fontSize: 15),),
      ),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          ColoredBox(color: Colors.white,child: Center(child: Text("Menu 1",style: TextStyle(fontSize: 25),)),),
          ColoredBox(color: Colors.white,child: Center(child: Text("Menu 2",style: TextStyle(fontSize: 25),)),),
          ColoredBox(color: Colors.white,child: Center(child: Text("Menu 3",style: TextStyle(fontSize: 25),)),),
          ColoredBox(color: Colors.white,child: Center(child: Text("Menu 4",style: TextStyle(fontSize: 25),)),),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        color: Colors.black,
        itemColor: Colors.white,
        controller: _controller,
        flat: true,
        useActiveColorByDefault: false,
        items: [
          RollingBottomBarItem(Icons.home, label: 'Menu 1', activeColor: Colors.green),
          RollingBottomBarItem(Icons.star, label: 'Menu 2', activeColor: Colors.green),
          RollingBottomBarItem(Icons.person, label: 'Menu 3', activeColor: Colors.green),
          RollingBottomBarItem(Icons.access_alarm, label: 'Menu 4', activeColor: Colors.green),
        ],
        enableIconRotation: true,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}