import 'package:dttv/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SizedBox(
          height: Get.height,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  verticalDirection: VerticalDirection.down,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: controller.selected.map((dynamic item) {
                    int index = controller.selected.indexOf(item);
                    return InkWell(
                      key: controller.unselectedListKey[index],
                      onTap: () => _moveItem(
                        fromIndex: index,
                        fromList: controller.selected,
                        keys: controller.unselectedListKey[index],
                        controller: controller,
                        // fromKey: controller.selectedListKey,
                        toList: controller.unselected,
                        // toKey: controller.unselectedListKey,
                        context: context,
                      ),
                      child: Item(text: controller.selected[index]),
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
                  children: controller.unselected.map((dynamic item) {
                    int index = controller.unselected.indexOf(item);
                    return InkWell(
                      key: controller.unselectedListKey[index],
                      onTap: () => _moveItem(
                        controller: controller,
                        fromIndex: index,
                        fromList: controller.unselected,
                        toList: controller.selected,
                        keys: controller.unselectedListKey[index],
                        context: context,
                      ),
                      child: Item(text: controller.unselected[index]),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  int _flyingCount = 0;

  _moveItem({
    required int fromIndex,
    required BuildContext context,
    required List fromList,
    required GlobalKey keys,
    required List toList,
    required HomeController controller,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    final globalKey = GlobalKey();
    final item = fromList.removeAt(fromIndex);

    // keys.currentState?.removeItem(
    //   fromIndex,
    //   (context, animation) {
    //     return SizeTransition(
    //       sizeFactor: animation,
    //       child: Opacity(
    //         key: globalKey,
    //         opacity: 0.0,
    //         child: Item(text: item),
    //       ),
    //     );
    //   },
    //   duration: duration,
    // );
    // _flyingCount++;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      // Find the starting position of the moving item, which is exactly the
      // gap its leaving behind, in the original list.
      final box1 = keys.currentContext?.findRenderObject() as RenderBox;
      final pos1 = box1.localToGlobal(Offset.zero);
      // Find the destination position of the moving item, which is at the
      // end of the destination list.
      final box2 = keys.currentContext!.findRenderObject() as RenderBox;
      final box2height = box1.size.height * (toList.length + _flyingCount - 1);
      final pos2 = box2.localToGlobal(Offset(0, box2height));
      // Insert an overlay to "fly over" the item between two lists.
      // final entry = OverlayEntry(builder: (BuildContext context) {
      //   return TweenAnimationBuilder(
      //     tween: Tween<Offset>(begin: pos1, end: pos2),
      //     duration: duration,
      //     builder: (_, Offset value, child) {
      //       return Positioned(
      //         left: value.dx,
      //         top: value.dy,
      //         child: Item(text: item),
      //       );
      //     },
      //   );
      // });

      // Overlay.of(context)!.insert(entry);
      // await Future.delayed(duration);
      // entry.remove();
      // toList.add(item);
      // toKey.currentState!.insertItem(toList.length - 1);
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
