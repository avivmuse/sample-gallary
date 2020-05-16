//home_page.dart
import 'package:flutter/material.dart';
import 'package:sample_flutter_app/pages/gallery_page/gallery_page.dart';
import 'package:sample_flutter_app/ui/custom_raised_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomRaisedButton(
            isLoading: _isLoading,
            child: Text(
              'Login',
              style: TextStyle(fontSize: 25),
            ),
            onPressed: _login,
          ),
        ),
      ),
    );
  }

  _login() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration(milliseconds: 5000), () {
      Navigator.pushNamed(context, '/gallery_page');
//      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//        return GalleryPage();
//      }));
    });
  }
}
