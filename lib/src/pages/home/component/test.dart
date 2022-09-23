import 'package:dttv/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'dart:math' as math;

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: 50,
              //   child: AnimatedList(
              //     key: controller.unselectedListKey,
              //     initialItemCount: controller.unselected.length,
              //     itemBuilder: (context, index, animation) {
              //       return InkWell(
              //         onTap: () => _moveItem(
              //           fromIndex: index,
              //           fromList: controller.unselected,
              //           fromKey: controller.unselectedListKey,
              //           toList: controller.selected,
              //           toKey: controller.selectedListKey,
              //           context: context,
              //         ),
              //         child: Item(text: controller.unselected[index]),
              //       );
              //     },
              //   ),
              // ),

              Wrap(
                spacing: 10,
                runSpacing: 10,
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                key: controller.unselectedListKey,
                children: controller.unselected.map((dynamic item) {
                  int index = controller.unselected.indexOf(item);
                  return InkWell(
                    onTap: () => _moveItem(
                      fromIndex: index,
                      fromList: controller.unselected,
                      fromKey: controller.unselectedListKey,
                      toList: controller.selected,
                      toKey: controller.selectedListKey,
                      context: context,
                    ),
                    child: Item(text: controller.unselected[index]),
                  );
                }).toList(),
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                key: controller.selectedListKey,
                children: controller.selected.map((dynamic item) {
                  int index = controller.selected.indexOf(item);
                  return InkWell(
                    onTap: () => _moveItem(
                      fromIndex: index,
                      fromList: controller.selected,
                      fromKey: controller.selectedListKey,
                      toList: controller.unselected,
                      toKey: controller.unselectedListKey,
                      context: context,
                    ),
                    child: Item(text: controller.selected[index]),
                  );
                }).toList(),
              ),
              // SizedBox(
              //   width: 50.0,
              //   child: AnimatedList(
              //     key: controller.selectedListKey,
              //     initialItemCount: controller.selected.length,
              //     itemBuilder: (context, index, animation) {
              //       return InkWell(
              //         onTap: () => _moveItem(
              //           fromIndex: index,
              //           fromList: controller.selected,
              //           fromKey: controller.selectedListKey,
              //           toList: controller.unselected,
              //           toKey: controller.unselectedListKey,
              //           context: context,
              //         ),
              //         child: Item(text: controller.selected[index]),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        );
        // return Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Text(
        //         controller.randomText(controller.textTest),
        //         style:
        //             const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        //       ),
        //       const SizedBox(
        //         height: 16.0,
        //       ),
        //       Container(
        //         margin: const EdgeInsets.all(15.0),
        //         padding: const EdgeInsets.all(3.0),
        //         height: 50.0,
        //         decoration:
        //             BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        //       ),
        //       Wrap(
        //         spacing: 10,
        //         runSpacing: 10,
        //         verticalDirection: VerticalDirection.down,
        //         crossAxisAlignment: WrapCrossAlignment.center,
        //         alignment: WrapAlignment.center,
        //         direction: Axis.horizontal,
        //         children: controller
        //             .randomList(controller.textTest)
        //             .map((dynamic item) => Container(
        //                   width: 50,
        //                   height: 50,
        //                   color: Color((math.Random().nextDouble() * 0xFFFFFF)
        //                           .toInt())
        //                       .withOpacity(1.0),
        //                   alignment: Alignment.center,
        //                   child: Text(
        //                     item.toString(),
        //                     style: const TextStyle(
        //                         fontWeight: FontWeight.w700,
        //                         fontSize: 16,
        //                         color: Colors.white),
        //                   ),
        //                 ))
        //             .toList(),
        //       ),
        // ListView(
        //   shrinkWrap: true,
        //   scrollDirection: Axis.horizontal,
        //   children:
        //    controller
        //       .randomList(controller.textTest)
        //       .map((dynamic item) => Container(
        //             width: 50,
        //             height: 50,
        //             color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        //             alignment: Alignment.center,
        //             child: Text(
        //               item.toString(),
        //               style: const TextStyle(
        //                   fontWeight: FontWeight.w700,
        //                   fontSize: 16,
        //                   color: Colors.white),
        //             ),
        //           ))
        //       .toList(),
        // ),

        // controller.randomList(controller.textTest).map((e) {
        //   return Container();
        // }),
        //     ],
        //   ),
        // );
      },
    );
  }

  int _flyingCount = 0;

  _moveItem({
    required int fromIndex,
    required BuildContext context,
    required List fromList,
    required GlobalKey<AnimatedListState> fromKey,
    required List toList,
    required GlobalKey<AnimatedListState> toKey,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    final globalKey = GlobalKey();
    final item = fromList.removeAt(fromIndex);
    fromKey.currentState?.removeItem(
      fromIndex,
      (context, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: Opacity(
            key: globalKey,
            opacity: 0.0,
            child: Item(text: item),
          ),
        );
      },
      duration: duration,
    );
    _flyingCount++;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      // Find the starting position of the moving item, which is exactly the
      // gap its leaving behind, in the original list.
      final box1 = globalKey.currentContext?.findRenderObject() as RenderBox;
      final pos1 = box1.localToGlobal(Offset.zero);
      // Find the destination position of the moving item, which is at the
      // end of the destination list.
      final box2 = toKey.currentContext!.findRenderObject() as RenderBox;
      final box2height = box1.size.height * (toList.length + _flyingCount - 1);
      final pos2 = box2.localToGlobal(Offset(0, box2height));
      // Insert an overlay to "fly over" the item between two lists.
      final entry = OverlayEntry(builder: (BuildContext context) {
        return TweenAnimationBuilder(
          tween: Tween<Offset>(begin: pos1, end: pos2),
          duration: duration,
          builder: (_, Offset value, child) {
            return Positioned(
              left: value.dx,
              top: value.dy,
              child: Item(text: item),
            );
          },
        );
      });

      Overlay.of(context)!.insert(entry);
      await Future.delayed(duration);
      entry.remove();
      toList.add(item);
      toKey.currentState!.insertItem(toList.length - 1);
      _flyingCount--;
    });
  }
}

class Item extends StatelessWidget {
  final String text;

  const Item({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        child: Text(text),
        radius: 24,
      ),
    );
  }
}
