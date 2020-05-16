import 'package:flutter/material.dart';
import 'package:sample_flutter_app/ui/custom_raised_button.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<String> _images = [
    "https://image.tmdb.org/t/p/w500/xvx4Yhf0DVH8G4LzNISpMfFBDy2.jpg",
    "https://image.tmdb.org/t/p/w500/svIDTNUoajS8dLEo7EosxvyAsgJ.jpg",
    "https://image.tmdb.org/t/p/w500/iiZZdoQBEYBv6id8su7ImL0oCbD.jpg"
  ];
  int _index = 0;

  void _handleNext() {
    setState(() {
      _index++;
    });
  }

  void _handlePrevious() {
    setState(() {
      _index--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gallery Page'),
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 10.0,
                            spreadRadius: 0.4)
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      child: Image.network(
                        _images[_index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: _buildButton(
                      context: context,
                      title: 'Previous',
                      onPressed: _index > 0
                          ? () {
                              _handlePrevious();
                            }
                          : null,
                    ),
                  ),
                  Expanded(
                    child: _buildButton(
                      context: context,
                      title: 'Next',
                      onPressed: _index < (_images.length - 1)
                          ? () {
                              _handleNext();
                            }
                          : null,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildButton(
      {BuildContext context, String title, VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CustomRaisedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
