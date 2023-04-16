import 'package:flutter/material.dart';
import 'package:modais_flutter/screens/screen02.dart';
import 'package:modais_flutter/screens/screen03.dart';
import 'package:modais_flutter/widgets/my_drawer.dart';

class Screen01 extends StatefulWidget {
  final String title;
  const Screen01({super.key, required this.title});

  @override
  State<Screen01> createState() => _Screen01State();
}

class _Screen01State extends State<Screen01> {
  int screenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {
      'title': 'Lista de Categorias',
      'screen': const Screen02(
        title: 'Tela 02',
      ),
    },
    {
      'title': 'Meus Favoritos',
      'screen': const Screen03(
        title: 'Tela 03',
      ),
    },
  ];

  void _selectScreen(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[screenIndex]['title'] as String),
      ),
      drawer: MyDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: _screens[screenIndex]['screen'] as Widget,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.pink.withOpacity(0.8),
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.black,
        currentIndex: screenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.control_camera,
            ),
            label: 'Tela 02',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation_outlined),
            label: 'Tela 03',
          ),
        ],
      ),
    );
  }
}
