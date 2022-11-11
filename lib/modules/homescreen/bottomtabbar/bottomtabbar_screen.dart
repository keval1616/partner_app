import 'package:flutter/material.dart';
import 'package:gymui/tabs/about_us_tab.dart';
import 'package:gymui/tabs/history_tab.dart';
import 'package:gymui/tabs/qr_code_tab.dart';
import 'package:gymui/utils.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AboutUsTab(),
    QrCodeTab(),
    HistoryTab()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  Widget bottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: _selectedIndex == 0
                      ? Colors.green.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: _selectedIndex == 0 ? Colors.green : Colors.grey,
                    size: 30.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'About Us',
                    style: TextStyle(
                        color:
                            _selectedIndex == 0 ? Colors.green : Colors.grey),
                  ),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: _selectedIndex == 1
                      ? Colors.green.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code_2_outlined,
                    color: _selectedIndex == 1 ? Colors.green : Colors.grey,
                    size: 30.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'QR Code',
                    style: TextStyle(
                        color:
                            _selectedIndex == 1 ? Colors.green : Colors.grey),
                  ),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              decoration: BoxDecoration(
                  color: _selectedIndex == 2
                      ? Colors.green.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history_outlined,
                    color: _selectedIndex == 2 ? Colors.green : Colors.grey,
                    size: 30.0,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'History',
                    style: TextStyle(
                        color:
                            _selectedIndex == 2 ? Colors.green : Colors.grey),
                  ),
                ],
              ),
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        elevation: 0.0,
      ),
    );
  }
}
