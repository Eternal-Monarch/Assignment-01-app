import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment 01',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _currentPageIndex = 0;
  final List<Widget> _pages = [
    Page(number: 1, color: Colors.yellow),
    Page(number: 2, color: Colors.blue),
    Page(number: 3, color: Colors.red),
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentPageIndex = _tabController.index;
      });
    });
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
        title: Text('Assignment 01'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('This is Page 1'),
              onTap: () {
                _tabController.animateTo(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('This is Page 2'),
              onTap: () {
                _tabController.animateTo(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('This is Page 3'),
              onTap: () {
                _tabController.animateTo(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index) {
          _tabController.animateTo(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'this is Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'this is Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'this is Page 3',
          ),
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  final int number;
  final Color color;

  const Page({required this.number, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'this is our Page $number',
          style: TextStyle(fontSize: 34),
        ),
      ),
    );
  }
}
