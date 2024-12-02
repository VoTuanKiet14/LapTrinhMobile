import 'package:flutter/material.dart';
import 'package:moi/baitap1.dart';

class HomeScreenExample extends StatelessWidget {
  const HomeScreenExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BorderExample'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.yellow,
                backgroundImage: NetworkImage('https://picsum.photos/200/200'),
              ),
              title: Text('list 1'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Mô tả ngắn gọn về bài viết 1'),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.yellow,
                backgroundImage: NetworkImage('https://picsum.photos/200/200'),
              ),
              title: Text('list 1'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Mô tả ngắn gọn về bài viết 2'),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.yellow,
                backgroundImage: NetworkImage('https://picsum.photos/200/200'),
              ),
              title: Text('list 1'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Mô tả ngắn gọn về bài viết 3'),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.yellow,
                backgroundImage: NetworkImage('https://picsum.photos/200/200'),
              ),
              title: Text('list 1'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Mô tả ngắn gọn về bài viết 4'),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.yellow,
                backgroundImage: NetworkImage('https://picsum.photos/200/200'),
              ),
              title: Text('list 1'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Mô tả ngắn gọn về bài viết 5'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarOfLogin extends StatefulWidget {
  const BottomNavigationBarOfLogin({super.key});

  @override
  State<BottomNavigationBarOfLogin> createState() => _BottomNavigationBarExampleStatee();
}

//
class _BottomNavigationBarExampleStatee extends State<BottomNavigationBarOfLogin> {
  int _selectedIndex = 0;
  // Sử dụng các class có sẵn
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreenExample(),
    const ProfilePage(),
  ];
  // Hàm xử lý khi tap vào item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BottomNavigationBar'),
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),

          ],
          // Index cua item dang duoc chon
          currentIndex: _selectedIndex,
          // Màu của item khi được chọn
          selectedItemColor: Colors.amber[800],
          // Hàm xử lý khi tap vào item
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}