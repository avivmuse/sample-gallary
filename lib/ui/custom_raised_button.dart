import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool isLoading;

  const CustomRaisedButton({
    this.onPressed,
    this.child,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
      color: Theme.of(context).buttonColor,
      textColor: Theme.of(context).accentTextTheme.button.color,
      child: this.isLoading ? CircularProgressIndicator() : this.child,
      onPressed: this.isLoading ? null : this.onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: Theme.of(context).buttonColor),
      ),
    ));
  }
}
