import 'package:flutter/material.dart';

class DemoClass extends StatefulWidget {
  DemoClass({Key? key}) : super(key: key);

  @override
  State<DemoClass> createState() => _DemoClassState();
}

class _DemoClassState extends State<DemoClass> {
  List<Widget> profiles = [];
  List<Widget> profiles1 = [];
  int selectedIndex = -1;
  double firstItemLeftPos = -200;
  double firstItemTopPos = 0;
  GlobalKey finalWidgetKey = GlobalKey();
  List<GlobalKey> profileKey = [];
  int animDuration = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profiles = List.generate(20, (index) {
      GlobalKey itemKey = GlobalKey();

      profileKey.add(itemKey);
      return InkWell(
        key: profileKey[index],
        onTap: () {
          RenderBox box =
              profileKey[index].currentContext?.findRenderObject() as RenderBox;
          Offset position = box.localToGlobal(Offset.zero);
          selectedIndex = index;
          firstItemTopPos = position.dy;
          firstItemLeftPos = position.dx;
          animDuration = 0;
          setState(() {});
          Future.delayed(Duration(milliseconds: 10), () {
            RenderBox FinalRenderbox =
                finalWidgetKey.currentContext?.findRenderObject() as RenderBox;
            Offset finalPos = FinalRenderbox.localToGlobal(Offset.zero);
            firstItemLeftPos = finalPos.dx;
            firstItemTopPos = finalPos.dy;
            animDuration = 500;
            setState(() {});
          });
        },
        child: CircleAvatar(
          child: Text("$index"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 30,
                  child: Container(
                    key: finalWidgetKey,
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                  ),
                ),
                AnimatedPositioned(
                    left: firstItemLeftPos,
                    top: firstItemTopPos,
                    child: CircleAvatar(
                      child: Text("$selectedIndex"),
                    ),
                    duration: Duration(milliseconds: animDuration))
              ],
            ),
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            direction: Axis.horizontal,
            children: profiles,
          ),
        ],
      ),
    );
  }
}
