import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class ChildRegister extends GetView<HomeController> {
  const ChildRegister({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kind Registrieren'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                controller: controller.name,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nachname',
                ),
                controller: controller.surname,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Alter',
                ),
                controller: controller.age,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Krankheiten',
                ),
                controller: controller.krankheiten,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Adresse',
                ),
                controller: controller.adresse,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'PLZ',
                ),
                controller: controller.plz,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ort',
                ),
                controller: controller.ort,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Telefonnummer',
                ),
                controller: controller.telefonnummer,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                controller: controller.email,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Notfallnummer',
                ),
                controller: controller.notfallnummer,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Info',
                ),
                controller: controller.info,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Kontaktperson',
                ),
                controller: controller.kontaktperson,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Ausweisnummer',
                ),
                controller: controller.personalid,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Abholzeit',
                ),
                controller: controller.abholzeit,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.childs.add(Childs(
                      name: controller.name.text,
                      surname: controller.surname.text,
                      age: int.parse(controller.age.text),
                      krankheiten: controller.krankheiten.text,
                      adresse: controller.adresse.text,
                      plz: int.parse(controller.plz.text),
                      ort: controller.ort.text,
                      telefonnummer: int.parse(controller.telefonnummer.text),
                      email: controller.email.text,
                      notfallnummer: controller.notfallnummer.text,
                      info: controller.info.text,
                      kontaktperson: controller.kontaktperson.text,
                      personalid: controller.personalid.text,
                      betreuer: controller.betreuer.text,
                      abholzeit: controller.abholzeit.text,
                    ));
                    Get.back();
                  },
                  child: const Text('Kind Registrieren'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
