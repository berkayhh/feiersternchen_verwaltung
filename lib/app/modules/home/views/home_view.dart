import 'package:feiersternchen_verwaltung/app/modules/home/views/child_register.dart';
import 'package:feiersternchen_verwaltung/app/modules/home/views/chilld_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                'https://feiersternchen.de/wp-content/uploads/2024/02/weblogo-lang.png'),
            const Text(
              'Bitte wählen Sie Ihre Konto aus !',
              style: TextStyle(fontSize: 30),
            ),
            //Select the Worker
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                          title: 'Bitte geben Sie Ihre Pin ein',
                          content: TextFormField(
                            autofocus: true,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.pin = int.parse(value);
                            },
                          ),
                          onConfirm: () {
                            controller.checkUser(controller.pin);
                          });
                    },
                    child: Container(
                      width: 300,
                      height: 300,
                      //Show the profiles with name and Circular Avatar photo
                      child: const Column(
                        children: [
                          Text(
                            'Merivan',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 30,
                                color: Colors.blue),
                          ),
                          CircleAvatar(
                            //edit size width 500
                            radius: 100,
                            backgroundImage: NetworkImage(
                                'https://image.brigitte.de/13346816/t/Qo/v8/w1440/r1/-/feminismus-ist-die-kritik-an-disney-prinzessinnen-gerechtfertigt-jasmin.jpg'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    //Show the profiles with name and Circular Avatar photo
                    child: const Column(
                      children: [
                        Text(
                          'Alina',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 30,
                              color: Colors.blue),
                        ),
                        CircleAvatar(
                          //edit size width 500
                          radius: 100,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz3VRnPg-BOva2EL5bfUN4GfFQyqon-r9Ju1JO0TPpq2lJKt5atfAYjB381-3TcIflu-E&usqp=CAU'),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
