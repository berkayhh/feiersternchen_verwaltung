import 'package:feiersternchen_verwaltung/app/modules/home/views/child_register.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ChildListView extends GetView<HomeController> {
  const ChildListView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const ChildRegister());
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
        ),
        body: Center(
          child: Obx(() {
            if (controller.childs.isEmpty) {
              return const Text('Keine Kinder vorhanden');
            } else {
              return ListView.builder(
                  itemCount: controller.childs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.childs[index].name),
                      subtitle: Column(
                        children: [
                          Text(controller.childs[index].surname),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://image.brigitte.de/13346816/t/Qo/v8/w1440/r1/-/feminismus-ist-die-kritik-an-disney-prinzessinnen-gerechtfertigt-jasmin.jpg'),
                      ),
                      onTap: () {
                        Get.to(() => ChildRegister(),
                            arguments: controller.childs[index]);
                      },
                    );
                  });
            }
          }),
        ));
  }
}
