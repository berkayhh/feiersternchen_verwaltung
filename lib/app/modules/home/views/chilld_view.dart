import 'package:feiersternchen_verwaltung/app/modules/home/views/child_register.dart';
import 'package:feiersternchen_verwaltung/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
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
          leading: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.offAndToNamed(Routes.HOME);
            },
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.40,
                child: Column(
                  children: [
                    const Text("Angemeldete Kinder"),
                    SizedBox(
                      height: Get.height * 0.35,
                      child: Obx(() {
                        if (controller.childs.isEmpty) {
                          return const Text('Keine Kinder vorhanden');
                        } else {
                          return ListView.builder(
                              itemCount: controller.childs.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(controller.childs[index].name +
                                      " " +
                                      controller.childs[index].surname +
                                      "\n" +
                                      controller.childs[index].anmeldezeit),
                                  leading: const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://image.brigitte.de/13346816/t/Qo/v8/w1440/r1/-/feminismus-ist-die-kritik-an-disney-prinzessinnen-gerechtfertigt-jasmin.jpg'),
                                  ),
                                  onTap: () {
                                    Get.defaultDialog(
                                      title: "Bitte wählen Sie eine Funktion",
                                      content: SizedBox(
                                        width: Get.width * 0.5,
                                        height: Get.height * 0.5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            //Create a Row with Rounded Icons for the Functions with the Name and Icons
                                            //Functions Bearbeiten, abmelden, benachrichtigen,notfall
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  child: IconButton(
                                                    icon:
                                                        const Icon(Icons.edit),
                                                    onPressed: () {
                                                      Get.to(
                                                          () =>
                                                              const ChildRegister(),
                                                          arguments: controller
                                                              .childs[index]);
                                                    },
                                                  ),
                                                ),
                                                const Text(
                                                  "Bearbeiten",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  child: IconButton(
                                                    icon: const Icon(
                                                        Icons.delete),
                                                    onPressed: () {
                                                      Get.defaultDialog(
                                                        title: "Kind Abmelden",
                                                        content: Column(
                                                          children: [
                                                            Text(
                                                              "Möchten Sie das Kind wirklich abmelden ?",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                            Text(
                                                                "Ausweisnummer: ${controller.childs[index].personalid}"),
                                                            SizedBox(
                                                              width: Get.width *
                                                                  0.5,
                                                              height:
                                                                  Get.height *
                                                                      0.3,
                                                              child: Signature(
                                                                controller:
                                                                    controller
                                                                        .signaturecontroller,
                                                                height: 500,
                                                                width:
                                                                    Get.width,
                                                                backgroundColor:
                                                                    Colors
                                                                        .lightBlueAccent,
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                    //Color green

                                                                    onPressed:
                                                                        () {
                                                                      controller
                                                                          .abgemeledetekinder
                                                                          .add(controller
                                                                              .childs[index]);
                                                                      controller
                                                                          .childs
                                                                          .removeAt(
                                                                              index);
                                                                      Get.back();
                                                                      controller
                                                                          .signaturecontroller
                                                                          .clear();
                                                                      controller
                                                                          .update();
                                                                      Get.back();
                                                                    },
                                                                    child: Text(
                                                                        "Ja")),
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Get.back();
                                                                    },
                                                                    child: Text(
                                                                        "Nein")),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                const Text(
                                                  "Abmelden",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  child: IconButton(
                                                    icon: const Icon(
                                                        Icons.notifications),
                                                    onPressed: () {
                                                      //Send a Notification to the Parents
                                                    },
                                                  ),
                                                ),
                                                const Text(
                                                  "Benachrichtigen",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                CircleAvatar(
                                                  child: IconButton(
                                                    icon: const Icon(
                                                        Icons.warning),
                                                    onPressed: () {
                                                      Get.defaultDialog(
                                                        title:
                                                            "NOTFALL NUMMERN !",
                                                        content: Column(
                                                          children: [
                                                            Text(
                                                              "1- Krankenwagen: 112",
                                                              style: TextStyle(
                                                                  fontSize: 50,
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                            Text(
                                                              "2- Notfallnummer: ${controller.childs[index].notfallnummer}",
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                            Text(
                                                              "3- Kontaktnummer: ${controller.childs[index].telefonnummer} - ${controller.childs[index].kontaktperson}",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .green),
                                                            ),
                                                            ElevatedButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                child: Text(
                                                                    "Schliesen")),
                                                          ],
                                                        ),
                                                      );
                                                      //Send a Notification to the Parents
                                                    },
                                                  ),
                                                ),
                                                const Text(
                                                  "Notfall",
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                        }
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 20,
                  child: Divider(
                    color: Colors.black,
                  )),
              SizedBox(
                height: Get.height * 0.40,
                child: Column(
                  children: [
                    const Text("Abgemeldete Kinder"),
                    SizedBox(
                      height: Get.height * 0.35,
                      child: Obx(() {
                        if (controller.abgemeledetekinder.isEmpty) {
                          return const Text('Keine Kinder vorhanden');
                        } else {
                          return ListView.builder(
                              itemCount: controller.abgemeledetekinder.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(controller
                                          .abgemeledetekinder[index].name +
                                      " " +
                                      controller
                                          .abgemeledetekinder[index].surname),
                                  leading: const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://image.brigitte.de/13346816/t/Qo/v8/w1440/r1/-/feminismus-ist-die-kritik-an-disney-prinzessinnen-gerechtfertigt-jasmin.jpg'),
                                  ),
                                  onTap: () {
                                    /*  Get.to(() => ChildRegister(),
                                        arguments: controller
                                            .abgemeledetekinder[index]); */
                                  },
                                );
                              });
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
