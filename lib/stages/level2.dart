import 'package:flutter/material.dart';
import 'package:logic_enhancer/classes/level_head2.dart';
import '../classes/LED2.dart';
import '../classes/bus.dart';
import '../classes/or_gate.dart';
import 'dart:ui' as ui;

int moves = 2;
LevelHead2 v = LevelHead2(
  "2",
  level2(),
  mov: moves,
);
int sat1 = 0;
int sat2 = 0;
int over1 = 0;
or_gate OR = or_gate(height: 100,width: 100,);

Bus a1 = Bus(
  activate: sat1,
  hor_length: 150,
  ver_length1: 80,
  ver_length2: 40,
  dy: -80,

);
Bus a2 = Bus(
  activate: sat2,
  hor_length: -150,
  ver_length1: -40,
  ver_length2: -80,
  dy: -80,
);
Bus a3 = Bus(
  activate: b,
  hor_length: 0,
  ver_length1: 0,
  ver_length2: 120,dx: 2.5,
  dy: 10,
);
int b = OR.activation(a1.activate, a2.activate);
LED LIGHT2 = LED(
  x: a3.activate,
  y: 2,
);
void set() {
  moves = 2;
  v = LevelHead2(
  "2",
  level2(),
  mov: moves,
);
  sat2 = 0;
  sat1 = 0;
  a1 = Bus(
    activate: sat1,
    hor_length: 150,
    ver_length1: 80,
    ver_length2: 40,
    dy: -80,
  );
  a2 = Bus(
    activate: sat2,
    hor_length: -150,
    ver_length1: -40,
    ver_length2: -80,
    dy: -80,
  );
  b = OR.activation(a1.activate, a2.activate);
  a3 = Bus(
    activate: b,
    hor_length: 0,
    ver_length1: 0,
    ver_length2: 120,dx: 2.5,
  dy: 10,
  );
  LIGHT2 = LED(
    x: a3.activate,
    y: 2,
  );
}

class level2 extends StatefulWidget {
  const level2({Key? key}) : super(key: key);

  @override
  State<level2> createState() => _level2State();
}

class _level2State extends State<level2> {
  var buttons = [
    "assets/images/button/button0.png",
    "assets/images/button/button1.png"
  ];

  @override
  void initState() {
    set();

    if (over1 == 0) {
      WidgetsBinding.instance?.addPostFrameCallback(
          (_) => Overlay.of(context)?.insert(_getEntry(context)));
      over1 = 1;
    }

    super.initState();
  }

  void test1() {
    setState(() {
     if(moves!=0){
moves-=1;
v = LevelHead2(
  "2",
  level2(),
  mov: moves,
);
}
      if (sat1 == 1) {
        sat1 = 0;
        a1 = Bus(
          activate: sat1,
          hor_length: 150,
          ver_length1: 80,
          ver_length2: 40,
          dy: -80,
        );
        b = OR.activation(a1.activate, sat2);
      } else {
        sat1 = 1;
        a1 = Bus(
          activate: sat1,
          hor_length: 150,
          ver_length1: 80,
          ver_length2: 40,
          dy: -80,
        );
        b = OR.activation(a1.activate, sat2);
      }
      if (b == 1) {
        a3 = Bus(
          activate: b,
          hor_length: 0,
          ver_length1: 0,
          ver_length2: 120,dx: 2.5,
  dy: 10,
        );
        LIGHT2 = LED(
          x: a3.activate,
          y: 2,
        );
      } else {
        a3 = Bus(
          activate: b,
          hor_length: 0,
          ver_length1: 0,
          ver_length2: 120,dx: 2.5,
  dy: 10,
        );
        LIGHT2 = LED(
          x: a3.activate,
          y: 2,
        );
      }
      print("b1:{$b}");
    });
  }

  void test2() {
    setState(() {
if(moves!=0){
moves-=1;
v = LevelHead2(
  "2",
  level2(),
  mov: moves,
);
}
      if (sat2 == 1) {
        sat2 = 0;
        a2 = Bus(
          activate: sat2,
          hor_length: -150,
          ver_length1: -40,
          ver_length2: -80,
          dy: -80,
        );
        b = OR.activation(sat1, a2.activate);
      } else {
        sat2 = 1;
        a2 = Bus(
          activate: sat2,
          hor_length: -150,
          ver_length1: -40,
          ver_length2: -80,
          dy: -80,
        );
        b = OR.activation(sat1, a2.activate);
      }
      if (b == 1) {
        a3 = Bus(
          activate: b,
          hor_length: 0,
          ver_length1: 0,
          ver_length2: 120,dx: 2.5,
  dy: 10,
        );
        LIGHT2 = LED(
          x: a3.activate,
          y: 2,
        );
      } else {
        a3 = Bus(
          activate: b,
          hor_length: 0,
          ver_length1: 0,
          ver_length2: 120,dx: 2.5,
  dy: 10,
        );
        LIGHT2 = LED(
          x: a3.activate,
          y: 2,
        );
      }
      print("b2:{$b}");
    });
  }

  Widget button1() {
    return FlatButton(
        onPressed: test1,
        child: Image.asset(
          buttons[sat1],
          width: 100,
          height: 100,
        ));
  }

  Widget button2() {
    return FlatButton(
        onPressed: test2,
        child: Image.asset(
          buttons[sat2],
          width: 100,
          height: 100,
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            v,
            SizedBox(
              height: 5,
            ),
            LIGHT2,
            SizedBox(
              height: 95,
            ),
            a3.show(),
            OR,
            SizedBox(
              height: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [a1.show(), button1()],
                ),
                SizedBox(
                  width: 200,
                ),
                Column(
                  children: [a2.show(), button2()],
                )
              ],
            )
          ],
        ));
  }

  OverlayEntry _getEntry(context) {
    OverlayEntry entry = OverlayEntry(builder: (_) => Container());

    entry = OverlayEntry(
      opaque: false,
      maintainState: true,
      builder: (_) => Positioned(
        left: 0,
        bottom: 0,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          ),
          child: Material(
            type: MaterialType.transparency,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 700,
                    height: 450,
                    color: Colors.black,
                    child: Column(
                      children: [
                        Image.asset(
                          "../../assets/images/or_unlocked.png",
                          scale: 0.5,
                        ),
                        TextButton(
                            onPressed: () {
                              entry.remove();
                            },
                            child: Text(
                              "GO",
                              style: TextStyle(fontSize: 50),
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
    return entry;
  }
}
