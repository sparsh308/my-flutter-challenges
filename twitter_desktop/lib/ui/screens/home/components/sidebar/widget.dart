import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:twitter_desktop/ui/screens/home/components/sidebar/navigation/item.dart';
import 'package:twitter_desktop/ui/screens/home/components/sidebar/navigation/widget.dart';
import 'package:twitter_desktop/ui/screens/home/components/sidebar/top_area.dart';
import 'package:twitter_desktop/ui/view_model/navigation_item.dart';

class Sidebar extends StatefulWidget {
  final double width;

  const Sidebar({
    Key key,
    this.width,
  }) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _currentIndex = 0;

  final _navigation = <NavigationItem>[
    NavigationItem(
      isSelected: true,
      icon: FeatherIcons.home,
      label: 'Home',
    ),
    NavigationItem(
      icon: FeatherIcons.compass,
      label: 'Explore',
    ),
    NavigationItem(
      icon: FeatherIcons.bell,
      label: 'Notifications',
    ),
    NavigationItem(
      icon: FeatherIcons.mail,
      label: 'Messages',
    ),
    NavigationItem(
      icon: FeatherIcons.bookmark,
      label: 'Bookmarks',
    ),
    NavigationItem(
      icon: FeatherIcons.user,
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
      width: widget.width,
      child: ListView(
        children: [
          SidebarTopArea(
            padding: const EdgeInsets.all(15),
          ),
          SizedBox(
            height: 35,
          ),
          NavigationBar(
            selectedIndex: _currentIndex,
            children: [
              for (int i = 0; i < _navigation.length; i++)
                NavigationBarItem(
                  isSelected: i == _currentIndex,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  icon: Icon(
                    _navigation[i].icon,
                  ),
                  label: _navigation[i].label,
                  onTap: () {
                    setState(() {
                      _currentIndex = i;
                    });
                  },
                ),
              NavigationBarItem(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                icon: Icon(
                  FeatherIcons.moreVertical,
                ),
                label: 'More',
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(15),
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              padding: EdgeInsets.all(15),
              elevation: 0,
              color: Theme.of(context).primaryColor,
              child: Text(
                'Tweet',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
