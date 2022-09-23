import 'package:dttv/src/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Center(
          child: Container(
            child: PageView.builder(
                itemCount: controller.listItem.length,
                onPageChanged: (value) {
                  // setState(() {
                  //   currentPage = value;
                  // });
                },
                controller: controller.pageController,
                itemBuilder: (BuildContext context, int index) {
                  var dismissibleKey = GlobalKey<State>();
                  return AnimatedBuilder(
                    animation: controller.pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (controller.pageController.position.haveDimensions) {
                        value = controller.pageController.page! - index;
                        value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
                      }

                      return Center(
                        child: SizedBox(
                          height: Curves.easeOut.transform(value) * 300,
                          width: Curves.easeOut.transform(value) * 250,
                          child: child,
                        ),
                      );
                    },
                    child: Dismissible(
                      key: dismissibleKey,
                      direction: DismissDirection.down,
                      onDismissed: (DismissDirection direction) {
                        /// Remove item from List
                        // setState(() {
                        //   listItem.removeAt(index);
                        // });
                      },
                      child: InkWell(
                        onLongPress: () {
                          debugPrint('Delete! $index');
                          // setState(() {
                          //   listItem.removeAt(index);
                          // });
                        },
                        onTap: () {
                          // controller.animateToPage(index,
                          //     duration: Duration(milliseconds: 500), curve: Curves.ease);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          // color: index % 2 == 0 ? Colors.blue : Colors.red,
                          color: Colors.lightBlueAccent,
                          child: Center(
                            child: Text('111'),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
