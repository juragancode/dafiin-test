import 'package:flutter/material.dart';
import 'package:flutter_application_36/pages/other_page.dart';

class WidgetCounter extends StatefulWidget {
  WidgetCounter({
    Key? key,
    required this.counter,
  }){
    print("__________________");
    print("Constructor Widget");
  }

  final int counter;

  @override
  _WidgetCounterState createState() {
    print("created()");
    return _WidgetCounterState();
  } 
}

class _WidgetCounterState extends State<WidgetCounter> {
 @override
  void initState() {
    super.initState();
    print("Init State");
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant WidgetCounter oldWidget) {
    print("Old: ${oldWidget.counter}");
    print("didUpdate");
    print("New: ${widget.counter}");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print("deactived");
    super.deactivate();
  }

  @override
  void dispose() { 
    print("dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${widget.counter}",
          style: TextStyle(fontSize: 35),
        ),
        SizedBox(
          height: 50,
        ),
        OutlinedButton(onPressed: () {
          Navigator.pushReplacementNamed(context, OtherPage.routeName, arguments: widget.counter);
        }, child: Text("Go To Other Page"))
      ],
    ));
  }
}
