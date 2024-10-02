import 'package:feiersternchen_verwaltung/app/modules/home/views/child_signature.dart';
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
                  child: const Text('Kind Registrieren'),
                  onPressed: () {
                    if (controller.name.text.isNotEmpty &&
                        controller.surname.text.isNotEmpty &&
                        controller.age.text.isNotEmpty &&
                        controller.krankheiten.text.isNotEmpty &&
                        controller.adresse.text.isNotEmpty &&
                        controller.plz.text.isNotEmpty &&
                        controller.ort.text.isNotEmpty &&
                        controller.telefonnummer.text.isNotEmpty &&
                        controller.email.text.isNotEmpty &&
                        controller.notfallnummer.text.isNotEmpty &&
                        controller.info.text.isNotEmpty &&
                        controller.kontaktperson.text.isNotEmpty &&
                        controller.personalid.text.isNotEmpty &&
                        controller.abholzeit.text.isNotEmpty) {
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
                        anmeldezeit: DateTime.now().toString(),
                      ));

                      controller.name.clear();
                      controller.surname.clear();
                      controller.age.clear();
                      controller.krankheiten.clear();
                      controller.adresse.clear();
                      controller.plz.clear();
                      controller.ort.clear();
                      controller.telefonnummer.clear();
                      controller.email.clear();
                      controller.notfallnummer.clear();
                      controller.info.clear();
                      controller.kontaktperson.clear();
                      controller.personalid.clear();
                      controller.abholzeit.clear();

                      Get.to(() => const ChildSignature());
                    } else {
                      Get.snackbar(
                          'Fehler', 'Bitte füllen Sie alle Felder aus');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
