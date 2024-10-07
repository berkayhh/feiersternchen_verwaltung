import 'package:feiersternchen_verwaltung/app/modules/home/views/chilld_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController krankheiten = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController plz = TextEditingController();
  TextEditingController ort = TextEditingController();
  TextEditingController telefonnummer = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController notfallnummer = TextEditingController();
  TextEditingController info = TextEditingController();
  TextEditingController kontaktperson = TextEditingController();
  TextEditingController personalid = TextEditingController();
  TextEditingController betreuer = TextEditingController();
  TextEditingController abholzeit = TextEditingController();
  RxList<Childs> childs = <Childs>[].obs;
  late int pin;

  RxList<Childs> abgemeledetekinder = <Childs>[].obs;

  Future<void> launchCustomUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  final SignatureController signaturecontroller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
  );

  checkUser(int pin) {
    if (pin == 1234) {
      Get.to(() => const ChildListView());
    } else {
      Get.snackbar('Fehler', 'Falscher Pin');
    }
  }

  @override
  void dispose() {
    signaturecontroller.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}

class Childs {
  String name;
  String surname;
  int age;
  String krankheiten;
  String adresse;
  int plz;
  String ort;
  int telefonnummer;
  String email;
  String notfallnummer;
  String info;
  String kontaktperson;
  String personalid;
  String betreuer;
  String abholzeit;
  String anmeldezeit;

  Childs({
    required this.name,
    required this.surname,
    required this.age,
    required this.krankheiten,
    required this.adresse,
    required this.plz,
    required this.ort,
    required this.telefonnummer,
    required this.email,
    required this.notfallnummer,
    required this.info,
    required this.kontaktperson,
    required this.personalid,
    required this.betreuer,
    required this.abholzeit,
    required this.anmeldezeit,
  });
}
