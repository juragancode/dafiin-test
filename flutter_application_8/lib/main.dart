import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_8/color_bloc.dart';

void main() {
  runApp(Xaiur());
}

class Xaiur extends StatefulWidget {
  @override
  _XaiurState createState() => _XaiurState();
}

class _XaiurState extends State<Xaiur> {
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyanAccent,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_amber);
              },
              backgroundColor: Colors.amber,
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_light_blue);
              },
              backgroundColor: Colors.lightBlue,
            ),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[700],
          title: Text("BLoC Tanpa Library"),
        ),
        body: Center(
          child: StreamBuilder(
            stream: bloc.stateStream,
            initialData: Colors.amber,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {}
              return ClipRRect(
                borderRadius: BorderRadius.circular(160),
                child: AnimatedContainer(
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Container(
                        width: 180,
                        height: 180,
                        child: Image(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://lh3.googleusercontent.com/uh3fkb_yJNcqaarUK9WoDqDu8B1A6tf99YUp0mOKoXdLoRpRdlD4ZczbVDJSi3IL11dyh2cF3n0GHUdBWsoWfbrqfA=w640-h400-e365-rj-sc0x00ffffff")),
                      ),
                    ),
                  ),
                  duration: Duration(milliseconds: 500),
                  width: 320,
                  height: 320,
                  color: snapshot.data,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
