import 'package:feiersternchen_verwaltung/app/modules/home/views/chilld_view.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ChildSignature extends GetView<HomeController> {
  const ChildSignature({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                  "Hiermite bestätige ich, dass ich die oben genannten Daten korrekt eingegeben habe"),
              InkWell(
                child: Text(
                  "Hiermite bestätige ich AGBs",
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  controller.launchCustomUrl(
                      Uri.parse("https://feiersternchen.de/agb/"));
                },
              ),
              InkWell(
                child: Text(
                  "Hiermite bestätige ich Datenschutzbestimmungen",
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  controller.launchCustomUrl(
                      Uri.parse("https://feiersternchen.de/privacy-policy/"));
                },
              ),
              InkWell(
                child: Text(
                  "Hiermite bestätige ich Einverständniserklärung",
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () {
                  controller.launchCustomUrl(
                      Uri.parse("https://feiersternchen.de/privacy-policy/"));
                },
              ),
              SizedBox(
                height: 500,
                width: Get.width,
                child: Signature(
                  controller: controller.signaturecontroller,
                  height: 500,
                  width: Get.width,
                  backgroundColor: Colors.lightBlueAccent,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.signaturecontroller.clear();
                  Get.to(() => ChildListView());
                },
                child: const Text('Anmeldung Abschließen'),
              ),
            ],
          ),
        ));
  }
}
