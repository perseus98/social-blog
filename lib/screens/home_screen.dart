import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_blog/config/google_sign_in_methods.dart';
import 'package:social_blog/config/screen_routes.dart';
import 'package:social_blog/screens/create_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return true ? CreatePostScreen() : Scaffold(
      key: _homeScaffoldKey,
      appBar: AppBar(
        title: Text("Home Screen"),
        leading: IconButton(
            onPressed: () {
              if (_homeScaffoldKey.currentState!.hasDrawer) {
                _homeScaffoldKey.currentState!.openDrawer();
              }
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
      ),
      drawer: _homeScreenDrawer(),
      body: Center(
        child: Text(FirebaseAuth.instance.currentUser.toString()),
      ),
    );
  }

  Widget _homeScreenDrawer() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu Options'),
          ),
          ListTile(
            title: const Text('Current User : '),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Signout'),
            onTap: () async {
              await GoogleSignInMethods.signOut();
              await FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, ScreenRoutes.authScreen);
            },
          ),
          Divider(),
          ListTile(
            title: const Text('Exit'),
            onTap: () {
              SystemNavigator.pop();
            },
          ),
        ],
      ),
    );
  }
}
