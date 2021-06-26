import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  bool switchValue = false;
  double _sliverHeight = 150.0;
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 4.0,
            pinned: true,
            expandedHeight: _sliverHeight,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/user_header.png',
                fit: BoxFit.cover,
              ),
              stretchModes: [
                StretchMode.zoomBackground,
              ],
            ),
            leading: Opacity(
              opacity: _scrollController.hasClients
                  ? _scrollController.offset < _sliverHeight
                      ? _scrollController.offset / _sliverHeight
                      : 1.0
                  : 0.0,
              child: Icon(
                Icons.person,
              ),
            ),
            title: Opacity(
              opacity: _scrollController.hasClients
                  ? _scrollController.offset < _sliverHeight
                      ? _scrollController.offset / _sliverHeight
                      : 1.0
                  : 0.0,
              child: Text(
                'Guest',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _userInfoTitle('User Information'),
                Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
                _userInfoTile('Email', 'Empty', Icons.email),
                _userInfoTile('Phone', 'Empty', Icons.phone),
                _userInfoTile('Address', 'Empty', Icons.local_shipping),
                _userInfoTile('Joined Date', 'Empty', Icons.watch_later),
                _userInfoTitle('User Setting'),
                Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.dark_mode),
                  trailing: Switch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ),
                _userInfoTile('Logout', '', Icons.exit_to_app_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _userInfoTile(String title, String subtitle, IconData icon) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }

  Widget _userInfoTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
