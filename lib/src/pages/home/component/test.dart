import 'package:flutter/material.dart';

class AddToFave extends StatefulWidget {
  const AddToFave({Key? key}) : super(key: key);

  @override
  _AddToFaveState createState() => _AddToFaveState();
}

class _AddToFaveState extends State<AddToFave> {
  List<String> unselected = ['1', '2', '3', '4', '5'];
  List<GlobalKey> unselectedKey = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  List<GlobalKey> selectedKey = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];
  List<String> selected = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                children: selected.map((e) {
                  int index = selected.indexOf(e);
                  return InkWell(
                      key: unselectedKey[index],
                      onTap: () {
                        RenderBox box = unselectedKey[index]
                            .currentContext
                            ?.findRenderObject() as RenderBox;
                        Offset position = box.localToGlobal(Offset.zero);
                        // unselected.add(selected[index]);
                        // selected.removeAt(index);
                        setState(() {});
                      },
                      child: TweenAnimationBuilder(
                        tween: Tween<Offset>(
                            begin: Offset(177.5, 47.0),
                            end: Offset(377.5, 47.0)),
                        duration: const Duration(milliseconds: 500),
                        builder: (_, Offset value, child) {
                          return Positioned(
                            left: value.dx,
                            top: value.dy,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width / 5)),
                              child: Center(
                                  child: Text(
                                selected[index],
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          );
                        },
                      ));
                }).toList(),
              ),
            ),
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                children: unselected.map((e) {
                  int index = unselected.indexOf(e);
                  return InkWell(
                    key: selectedKey[index],
                    onTap: () {
                      // selected.add(unselected[index]);
                      // unselected.removeAt(index);
                      setState(() {});
                    },
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width / 5)),
                      child: Center(
                          child: Text(
                        unselected[index],
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
