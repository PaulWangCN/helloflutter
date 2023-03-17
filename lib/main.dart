import 'package:flutter/material.dart';
import 'package:helloflutter/home.dart';
import 'package:helloflutter/person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Love',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My first flutter app!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 当前选中页索引
  var currentIndex = 0;

  currentPage() {
    switch (currentIndex) {
      case 0:
        return const Home();
      case 1:
        return const Person();
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        // 通过fixedColor设置选中的item的颜色
        type: BottomNavigationBarType.fixed,
        // 当前页面索引
        currentIndex: currentIndex,
        onTap: ((index) {
          setState(() {
            currentIndex = index;
          });
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '个人',
          ),
        ],
      ),
    );
  }
}
