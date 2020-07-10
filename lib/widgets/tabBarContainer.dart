import 'package:flutter/material.dart';

class TabBarContainer extends StatefulWidget {
  @override
  _TabBarContainerState createState() => _TabBarContainerState();
}

class _TabBarContainerState extends State<TabBarContainer>
    with SingleTickerProviderStateMixin {
  TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabcontroller,
      isScrollable: true,
      tabs: [
        Tab(
          text: 'General',
        ),
        Tab(
          text: 'Business',
        ),
        Tab(
          text: 'Entertainment',
        ),
        Tab(
          text: 'Health',
        ),
        Tab(
          text: 'Science',
        ),
        Tab(
          text: 'Sports',
        ),
      ],
    );
  }
}
